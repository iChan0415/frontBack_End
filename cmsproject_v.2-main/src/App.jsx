// import Header from "./Components/Header";
import "bootstrap/dist/css/bootstrap.min.css";
import { BrowserRouter, Routes, Route } from "react-router-dom";
//pages
import Team_D_Content from "./Components/Team_D_Content";
import Dashboard from "./pages/Dashboard";
import Landing from "./pages/Landing ";
import Team_D_View from "./Components/Team_D_View";
import Team_D_Verification from "./Components/Team_D_Verification";
import Team_D_Verif_nonuser from "./Components/Team_D_Verif_nonuser";
import About from "./pages/about";
import CertificateGenerator from "./pages/CertificateGenerator";

function App() {
  return (
    <>
      {/* <HeaderV2 /> */}
      <BrowserRouter>
        <Routes>
          <Route index element={<Dashboard />} />
          <Route path="/certificate" element={<Team_D_Content />} />
          <Route path="/landing" element={<Landing />} />
          <Route path="/viewCert" element={<Team_D_View />} />
          <Route path="/verification" element={<Team_D_Verification />} />
          <Route path="/verif_nonuser" element={<Team_D_Verif_nonuser />} />
          <Route path="/about" element={<About />} />
          <Route path="/certGen" element={<CertificateGenerator />} />
          {/* <Route path="/profile" element={<Verification />} /> */}
        </Routes>
      </BrowserRouter>
    </>
  );
}

export default App;
