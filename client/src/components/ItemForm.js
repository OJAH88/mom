import React, { useState, useEffect } from "react";
import {useHistory} from "react-router"
import {Form, Input, TextArea, Button, Select , Icon, Checkbox, Dropdown} from 'semantic-ui-react'

function ItemForm(handleSubmit) {
    const [email, setEmail] = useState("");
    const [user, setUser] = useState("");
    const [password, setPassword] = useState("");
    const [errors, setErrors] = useState([]);
    const [isLoading, setIsLoading] = useState(false);
    const history = useHistory();


    
  

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
          <Button block size="lg" type="submit">
            {isLoading ? "Loading..." : "Login"}
          </Button>
  
      </Form>
      
    );
  }
  

export default ItemForm