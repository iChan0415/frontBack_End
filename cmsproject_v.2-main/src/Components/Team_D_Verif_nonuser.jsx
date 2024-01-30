import "../Css/verification.css";

import React, { useState, useEffect } from 'react';
import Form from "react-bootstrap/Form";
import Button from "react-bootstrap/Button";
import { AiFillSafetyCertificate } from "react-icons/ai";
import Team_D_HeaderV2 from "./Team_D_HeaderV2";
import Team_D_HeaderLanding from "./Team_D_HeaderLanding";

const Team_D_Verif_nonuser = () => {
  const [serialNumber, setSerialNumber] = useState('');
  const [verificationData, setVerificationData] = useState(null);
  const [error, setError] = useState(null);

  const handleSerialNumberChange = (event) => {
    setSerialNumber(event.target.value);
  };

  const handleVerifyClick = () => {
    fetch(`http://localhost:8080/api/certifications/verify/${serialNumber}`)
      .then(response => {
        if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`);
        }
        return response.json();
      })
      .then(data => {
        setVerificationData(data);
        setError(null);
      })
      .catch(error => {
        setVerificationData(null);
        setError('Certification not found');
        console.error('Error fetching verification data:', error);
        alert("Certificate doesn't exist")
      });
  };

  useEffect(() => {
    // This effect runs when verificationData changes
    console.log("Updated Verification Data:", verificationData);
  }, [verificationData]); // Run the effect when verificationData changes

  return (
    <div>
      <Team_D_HeaderLanding />
      <section className="verification_container">
        <div className="verification_title">
          <span></span>
        </div>
        <div className="verification_search">
          <div className="left">
            <h2>Verify Course Certificate</h2>
            <Form.Control
              size="sm"
              type="text"
              placeholder="Enter Serial Number"
              onChange={handleSerialNumberChange}
            />
            <Button variant="primary" className="verify" onClick={handleVerifyClick}>
              Verify
            </Button>
          </div>
          <div className="right">
            <div className="nameVerification">
              <Form.Label>Name</Form.Label>
              <Form.Control
                size="sm"
                type="text"
                placeholder={verificationData ? verificationData[0]?.full_name : ""}
                readOnly
              />
            </div>
            <div className="serialVerification">
              <Form.Label>Certificate Serial No. <AiFillSafetyCertificate className="icon"/></Form.Label>
              <Form.Control
                size="sm"
                type="text"
                placeholder={verificationData ? verificationData[0]?.serial_no : ""}
                readOnly
              />
            </div>
            <div className="serialVerification">
              <Form.Label>Course Certified</Form.Label>
              <Form.Control
                size="sm"
                type="text"
                placeholder={verificationData ? verificationData[0]?.course_title : ""}
                readOnly
              />
            </div>
          </div>
        </div>
      </section>
    </div>
  );
};

export default Team_D_Verif_nonuser;
