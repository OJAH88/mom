import React, { useState, useEffect } from "react";
import {useHistory} from "react-router"
import { Button, Form, Input } from 'react-bootstrap'
import { Divider } from "semantic-ui-react";

function LoginForm({ onLogin }) {
  const [email, setEmail] = useState("");
  const [user, setUser] = useState("");
  const [password, setPassword] = useState("");
  const [errors, setErrors] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const history = useHistory();
  

  function handleSubmit(e) {
    e.preventDefault();
    setIsLoading(true);
    fetch("/login", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ email, password }),
    }).then((r) => {
      setIsLoading(false);
      if (r.ok) {
        r.json().then((user) => onLogin(user))
      // localStorage.setItem("token", user.token)
        } else {
          r.json().then((err) => setErrors(err.errors));
        }
        history.push('/')
      });
    }

  return (
    <Form onSubmit={handleSubmit}>

        <Form.Group size="lg" controlId="email">
          <Form.Label>Email</Form.Label>
          <Form.Control
            autoFocus
            type="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
          />
        </Form.Group>
 
        <Form.Group size="lg" controlId="password">
          <Form.Label>Password</Form.Label>
          <Form.Control
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
        </Form.Group>
        <Divider />
        <Button block size="lg" type="submit">
          {isLoading ? "Loading..." : "Login"}
        </Button>

    </Form>
    
  );
}

export default LoginForm;
