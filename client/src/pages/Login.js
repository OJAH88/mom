import { useState } from "react";
import LoginForm from "../components/LoginForm";
import RegistrationForm from "../components/RegistrationForm";
import { Form, Input } from 'react-bootstrap'
import { Button, Container, Image, Divider} from "semantic-ui-react";
import mama from '../images/mama.gif'


function Login({ onLogin }) {
  const [showLogin, setShowLogin] = useState(true);

  return (
    <Container text>
      <center><Image src={mama} /></center>
      <h3>Demo: </h3>
      <h5>email: foo@bar.com password: test</h5>
      {showLogin ? (
        <>
        <h3>Login</h3>
        <Divider />
          <LoginForm onLogin={onLogin} />
          <br></br>
          <h5>
            Don't have an account? &nbsp;
            <Button color="secondary" onClick={() => setShowLogin(false)}>
              Sign Up
            </Button>
          </h5>
        </>
      ) : (
        <>
       <h3>Register</h3>
       <Divider />
          <RegistrationForm onLogin={onLogin} />
          <h5>
            Already have an account? &nbsp;
            
            <Button color="secondary" onClick={() => setShowLogin(true)}>
              Log In
            </Button>
          </h5>
        </>
      )}
    </Container>
  );
}



export default Login;