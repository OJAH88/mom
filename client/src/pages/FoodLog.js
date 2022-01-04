import { useState, useEffect } from "react"
import React, { useHistory, useParams } from "react-router"
import {Container, Form, Input, TextArea, Button, Select , Icon, Checkbox, Feed} from 'semantic-ui-react'
import FoodLogCard from "../components/FoodLogCard"
import useFetch from "../components/useFetch"
import LogPost from "../components/LogPost"


const FoodLog = () => {
    const {id} = useParams() 
    const [user, setUser] = useState("")
    const [items, setItems] = useState([])
    const [food_logs, setLogs] = useState([])
    const history = useHistory();
    

    const addLog = (newFoodLog) => {
        setLogs([...food_logs, newFoodLog]);
    };



    useEffect(() => {
        fetch("/me").then((response) => {
          if (response.ok) {
            response.json().then((user) => setUser(user));
          }
        });
      }, []);

      useEffect(() => {
        fetch("/items")
          .then((r) => r.json())
          .then(setItems(items));
      }, []);
      
    
    useEffect(() => {
        fetch("/food_logs")
        .then((response) => response.json())
        .then((food_logs) => {
          setLogs(food_logs);
        });
    }, []);

    const handleDelete = (deletedLog) => {
        fetch(`/posts/${deletedLog.id}`, {
          method: "Delete",
          headers: { "Content-Type": "application/json" },
        }).then(() => {
          const updatedLogs = food_logs.filter((food_log) => food_log.id !== deletedLog.id);
          setLogs(updatedLogs);
        });
      };
       


    return (


        <Container text>
            <h1>Food Log</h1>
            
            {/* <Share addPost={addPost}/> */}
            {food_logs.slice(0).reverse().map((food_log) => (
          <LogPost key={food_log.id}  food_log={food_log} handleDelete={handleDelete} food_logs={food_logs}   />
          
        ))}

            </Container>
    )
}

export default FoodLog