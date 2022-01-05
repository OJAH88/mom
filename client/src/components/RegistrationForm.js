import React, { useState } from "react";
import { Form, Input } from 'react-bootstrap'
import { useHistory } from 'react-router'
import {  Divider, Button } from "semantic-ui-react";

function RegistrationForm({ onLogin }) {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [name, setName] = useState("");
  const [city, setCity] = useState("");
  const [state, setState] = useState("");
  const [errors, setErrors] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const history = useHistory();

  function handleSubmit(e) {
    e.preventDefault();
    setErrors([]);
    setIsLoading(true);
    fetch("/signup", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        email,
        password,
        name,
        city,
        state,
      }),
    }).then((r) => {
      setIsLoading(false);
      if (r.ok) {
        r.json().then((user) => onLogin(user));
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

<Form.Group size="lg" controlId="name">
          <Form.Label>Name</Form.Label>
          <Form.Control
            type="name"
            value={name}
            onChange={(e) => setName(e.target.value)}
          />
                  </Form.Group>

<Form.Group size="lg" controlId="city">
          <Form.Label>City</Form.Label>
          <Form.Control
            type="city"
            value={city}
            onChange={(e) => setCity(e.target.value)}
          />
                  </Form.Group>

<Form.Group size="lg" controlId="state">
          <Form.Label>State</Form.Label>
          <Form.Control
            type="state"
            value={state}
            onChange={(e) => setState(e.target.value)}
          />
                  </Form.Group>
                  <Divider />
                  <Button block size="lg" type="submit">
          {isLoading ? "Loading..." : "Register"}
        </Button>

    </Form>
  );
}

export default RegistrationForm;