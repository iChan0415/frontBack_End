import React, { useEffect, useState } from "react";
import jsPDF from "jspdf";
import img from "../assets/certificate-background.png";
import signatureImg from "../assets/Signiture.png";
import Team_D_HeaderV2 from "../Components/Team_D_HeaderV2";

const CertificateGenerator = () => {
  const [quiz, setQuiz] = useState([]);

  useEffect(() => {
    // Fetch quiz data when the components mounts
    const loadQuiz = async () => {
      try {
        const response = await fetch(
          "http://localhost:8080/api/quizTkn/userQuizTkn/13"
        );
        if (!response.ok) {
          throw new Error("Failed to fetch quiz data");
        }
        const data = await response.json();
        setQuiz(data);
      } catch (error) {
        console.error("Error fetching quiz data:", error);
      }
    };
    loadQuiz();
  }, []);

  const generateCertificate = async () => {
    console.log(quiz);
    if (!quiz) {
      console.error("Quiz data is not available or incomplete");
      return;
    }

    const name = quiz[0].userFullName;
    const userId = quiz[0].userID;
    console.log(userId);
    console.log(quiz[0].userFullName);
    const instructor = quiz[0].instructorFullName;
    const course = quiz[0].courseTitle;
    const courseCode = quiz[0].courseID;
    //console.log(courseCode);
    const quiztknId = quiz[0].quiztknID;

    const creditHours = quiz[0].courseStartDate;
    console.log(creditHours);

    // Calculate the percentage
    const courseQuizScore = quiz[0].quizScore;
    console.log(quiz[0].quizScore);
    const courseTargetScore = quiz[0].targetScore;
    console.log(quiz[0].targetScore);

    // Check if the percentage is at least 80%
    const percentage = (courseQuizScore / courseTargetScore) * 100;

    if (percentage >= 80) {
      const doc = new jsPDF({
        orientation: "landscape",
        unit: "mm",
        format: [297, 210]
      });

      // Add certificate background image
      doc.addImage(
        img,
        "PNG",
        0,
        0,
        doc.internal.pageSize.getWidth(),
        doc.internal.pageSize.getHeight()
      );

      // Recepient name display PDF
      doc.setFontSize(48);
      doc.setTextColor(162, 123, 66);
      doc.setFont("helvetica");
      const recipientNameTextWidth =
        (doc.getStringUnitWidth(name) * doc.internal.getFontSize()) /
        doc.internal.scaleFactor;
      const recipientPosition =
        70 + (225 - 70) / 2 - recipientNameTextWidth / 2;
      doc.text(name, recipientPosition, 103, { align: "left" });

      // Course title display PDF
      doc.setFontSize(20);
      doc.setTextColor(162, 123, 66);
      const courseTextWidth =
        (doc.getStringUnitWidth(course) * doc.internal.getFontSize()) /
        doc.internal.scaleFactor;
      const coursePosition = 140 + (245 - 140) / 2 - courseTextWidth / 2;
      doc.text(course, coursePosition, 117, { align: "left" });

      // Date "Month/Day/Year" display PDF
      const newDate = new Date();
      const options = { year: "numeric", month: "long", day: "numeric" };
      const formattedNewDate = newDate.toLocaleDateString(undefined, options);

      doc.setFontSize(17);
      doc.setTextColor(162, 123, 66);

      // Use a fixed position instead of coursePosition
      const datePositionX = 101; // Adjust this value as needed
      const datePositionY = 128;

      doc.text(`${formattedNewDate}`, datePositionX, datePositionY, {
        align: "left"
      });

      // Instructor name display PDF
      doc.setFontSize(14);
      doc.setTextColor(0, 0, 0);
      doc.setTextColor(162, 123, 66);
      const instructorTextWidth =
        (doc.getStringUnitWidth(instructor) * doc.internal.getFontSize()) /
        doc.internal.scaleFactor;
      const centerPosition = 170 + (228 - 170) / 2 - instructorTextWidth / 2;
      doc.text(instructor, centerPosition, 167, { align: "center" });

      const signatureImgDataUrl = await toDataUrl(signatureImg);
      const signatureWidth = 50;
      const signatureHeight = 50;
      const signatureHorizontalPosition =
        140 + (228 - 140) / 2 - signatureWidth / 2;
      doc.addImage(
        signatureImgDataUrl,
        "PNG",
        signatureHorizontalPosition,
        135,
        signatureWidth,
        signatureHeight
      );

      // Coursecode display PDF
      doc.setFontSize(11);
      doc.setTextColor(162, 123, 66);
      doc.text(`B55-00${courseCode}`, 73, 163, { align: "left" });

      // Date display small on bottom left
      const currentDate = new Date();
      const formattedDate = currentDate.toISOString().split("T")[0]; // Formats as "YYYY-MM-DD"
      doc.setFontSize(11);
      doc.setTextColor(162, 123, 66);
      doc.text(`${formattedDate}`, 90, 154, { align: "right" });

      const SerialcurrentDate = new Date();
      const SerialformattedDate = SerialcurrentDate.toISOString()
        .split("T")[0]
        .replace(/-/g, ""); // Formats as "YYYYMMDD"

      console.log(SerialformattedDate); // Add this line to log the formatted date

      // Serial number display PDF
      const serialNumber = Math.floor(Math.random() * 100);
      doc.setFontSize(11);
      doc.setTextColor(162, 123, 66);
      doc.text(
        `B55-${SerialformattedDate}${userId}${courseCode}${serialNumber}`,
        85,
        158,
        {
          align: "left"
        }
      );

      const startDate = new Date(creditHours);

      // Calculate the time difference in milliseconds
      const timeDifference = currentDate.getTime() - startDate.getTime();

      // Calculate the number of days
      const daysDifference = Math.floor(timeDifference / (1000 * 60 * 60 * 24));

      // Calculate the credit hours based on a 3-hour interval per day
      const calculatedCreditHours = daysDifference * 3;

      console.log(`Calculated Credit Hours: ${calculatedCreditHours}`);

      // Credit Hours display PDF
      doc.setFontSize(11);
      doc.setTextColor(162, 123, 66);
      doc.text(`${calculatedCreditHours} hrs`, 72, 167.2, { align: "left" });

      // Save the PDF file to send to the backend
      const pdfFile = new File([doc.output("blob")], `${name}-${course}.pdf`, {
        type: "application/pdf"
      });

      // Create form data to send the file to the backend
      const formDataToSend = new FormData();
      formDataToSend.append(
        "serial_no",
        `B55-${SerialformattedDate}${userId}${courseCode}${serialNumber}`
      );
      formDataToSend.append("file", pdfFile);
      formDataToSend.append("date_issued", formattedDate);
      formDataToSend.append("criteria", "test");
      formDataToSend.append("quiztkn_ID", quiztknId);

      // Send the PDF file to the backend
      fetch("http://localhost:8080/api/certifications", {
        method: "POST",
        body: formDataToSend
      })
        .then((response) => {
          console.log("Certificate saved:", response);
          // Handle success as needed
        })
        .catch((error) => {
          console.error("Error:", error);
          // Handle error as needed
        });
      alert(
        "Congratulations! You have successfully completed the assessment and earned a certificate."
      );
    } else {
      console.log("Quiz score is below 80%. Certificate not generated.");
      // Handle this case as needed, e.g., display a message to the user.
      alert(
        "Sorry, your quiz score is below 80%. You did not meet the certifcate criteria."
      );
    }
  };

  // Function to convert image URL to data URL
  function toDataUrl(url) {
    return new Promise((resolve, reject) => {
      const img = new Image();
      img.crossOrigin = "Anonymous";
      img.onload = function () {
        const canvas = document.createElement("canvas");
        const ctx = canvas.getContext("2d");
        canvas.width = img.width;
        canvas.height = img.height;
        ctx.drawImage(img, 0, 0);
        resolve(canvas.toDataURL("image/png"));
      };
      img.onerror = reject;
      img.src = url;
    });
  }

  return (
    <>
      <div>
        <Team_D_HeaderV2 />

        {/* Button to generate certificate */}
        <h1>COURSE ASSESMENT</h1>
        <div>
          <p>
            Click sumbit button to finish the assessment and get Certified on
            this Course
          </p>
        </div>
        <button onClick={generateCertificate}>Sumbit</button>
      </div>
    </>
  );
};

export default CertificateGenerator;
