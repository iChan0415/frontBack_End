import React from "react";
import Content from "../Components/Content";

const Certificate = () => {
  const samplePDF = "/PDF/Joshua Allada-Java programming.pdf";
  return (
    <div>
      <Content pdfPath={samplePDF} />
    </div>
  );
};

export default Certificate;
