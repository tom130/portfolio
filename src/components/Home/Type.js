import React from "react";
import Typewriter from "typewriter-effect";

function Type() {
  return (
      <Typewriter
          options={{
            strings: [
              "Fullstack Software Developer",
              "DevOPS Engineer",
              "Freelancer",
            ],
            autoStart: true,
            loop: true,
            deleteSpeed: 50,
          }}
      />
  );
}

export default Type;
