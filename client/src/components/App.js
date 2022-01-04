import React, { useEffect, useState } from "react";
import { Switch, Route } from "react-router-dom";
import NavBar from "./NavBar";
import Login from "../pages/Login";
import KitchenPage from "../pages/KitchenPage"
import FoodLog from "../pages/FoodLog"
import NewItem from "../pages/NewItem"
import { Container } from "semantic-ui-react";


function App() {
  const [user, setUser] = useState("")
  const [item, setItem] = useState([])
  const [items, setItems] = useState([])
  const [visible, setVisible] = React.useState(false);
  const [confirmLoading, setConfirmLoading] = React.useState(false);

  useEffect(() => {
    fetch("/items")
      .then((r) => r.json())
      .then(setItems);
  }, []);

  // const handleDelete = () => {
  //   setConfirmLoading(true);
  //   fetch("/items/" + item.id, {method: 'DELETE'})
  //   setTimeout(() => {
  //     setVisible(false);
  //     setConfirmLoading(false);
  //   }, 2000);
  // };





  useEffect(() => {
    fetch("/me").then((response) => {
      if (response.ok) {
        response.json().then((user) => setUser(user));
      }
    });
  }, []);

  if (!user) return <Login onLogin={setUser} />;



  return (
  <Container >
    <NavBar user={user} onLogin={setUser} setUser={setUser} />
    <main>
      <Switch>
      <Route path="/newitem">
            <NewItem user={user}  setUser={setUser} />
          </Route>
        <Route exact path="/">
          <KitchenPage user={user} setUser={setUser}  />
        </Route>
        <Route exact path="/foodlog">
          <FoodLog user={user} setUser={setUser} />
        </Route>
      </Switch>
      </main>
  </Container>
  );
}

export default App;
