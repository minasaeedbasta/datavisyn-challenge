import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";

function Page() {
  const { page } = useParams();
  const endpoint = page ? page : "";
  const [message, setMessage] = useState("Loading...");

  useEffect(() => {
    fetch(`https://api.datavisyn.online/${endpoint}`)
      .then(res => res.json())
      .then(data => setMessage(data.message))
      .catch(() => setMessage("Error fetching message"));
  }, [endpoint]);

  return (
    <div>
      <h1>{message}</h1>
    </div>
  );
}

export default Page;
