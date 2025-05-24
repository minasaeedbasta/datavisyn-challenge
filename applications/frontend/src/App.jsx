// import React, { useEffect, useState } from "react";
// import "./App.css";

// function App() {
//   const [user, setUser] = useState(null);

//   useEffect(() => {
//     fetch("/oauth2/userinfo", { credentials: "include" })
//       .then((res) => (res.ok ? res.json() : null))
//       .then(setUser)
//       .catch(() => setUser(null));
//   }, []);

//   if (!user) return <div className="centered">Loading...</div>;

//   return (
//     <div className="centered">
//       <h1>{user.email}</h1>
//       <a
//         className="logout-btn"
//         href="/oauth2/sign_out?rd=https://datavisyn.online"
//       >
//         Logout
//       </a>
//     </div>
//   );
// }

// export default App;


import React, { useState } from "react";
import "./App.css";

function App() {
  const [user, setUser] = useState(null);
  const [message, setMessage] = useState("");

  // Fetch OAuth2 user info on mount
  React.useEffect(() => {
    fetch("/oauth2/userinfo", { credentials: "include" })
      .then((res) => (res.ok ? res.json() : null))
      .then(setUser)
      .catch(() => setUser(null));
  }, []);

  const fetchBackendMessage = async () => {
    try {
      const res = await fetch("http://datavisyn-backend.backend.svc.cluster.local:8000/hello");
      const data = await res.json();
      setMessage(data.message);
    } catch (err) {
      setMessage("Failed to reach backend");
    }
  };

  if (!user) return <div className="centered">Loading...</div>;

  return (
    <div className="centered">
      <h1>{user.email}</h1>
      <button className="btn" onClick={fetchBackendMessage}>
        Fetch Backend Message
      </button>
      {message && <p>{message}</p>}
      <a
        className="logout-btn"
        href="/oauth2/sign_out?rd=https://datavisyn.online"
      >
        Logout
      </a>
    </div>
  );
}

export default App;
