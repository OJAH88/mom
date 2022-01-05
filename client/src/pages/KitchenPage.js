import { useEffect, useState } from "react";
import {Accordion} from "react-bootstrap"
import useFetch from "../components/useFetch"
import { useHistory, useParams } from "react-router"
import {AnchorButton, Code, H5, Intent, Switch} from "@blueprintjs/core";
import { Card, Item, Button, Divider } from "semantic-ui-react";
import { Container, Statistic } from "semantic-ui-react";
import ItemCard from "../components/ItemCard"
import CountUp from 'react-countup';


function KitchenPage() {
    const {id} = useParams()
    const { data: item, error, isLoading } = useFetch('items/' + id) 
    const [user, setUser] = useState("")
    const [count, setCount] = useState("")
    const [kitchen, setKitchen] = useState("")
    const [items, setItems] = useState([])
    const APIKey = "791c38b6590849fbaa96e94f3396a7ef"
    const [veggies, setVeggies] = useState([])
    const [visible, setVisible] = useState(false);
    const [confirmLoading, setConfirmLoading] = useState(false);

    useEffect(() => {
        fetch("/me").then((response) => {
          if (response.ok) {
            response.json().then((user) => setUser(user));
          }
        });
      }, []);
      
      // const handleDelete = () => {
      //   fetch('/items/' + item.id, {
      //     method: "Delete",
      //   })
      //   .then(console.log(item))
      //   .then(() => {
      //     setItems(items);
      //   setTimeout(() => {
      //     setVisible(false);
      //     setConfirmLoading(false);
      //   }, 2000);
      // })}



    // useEffect(() => {
    //   fetch("https://api.spoonacular.com/food/products/search?query=vegetables?apiKey=791c38b6590849fbaa96e94f3396a7ef")
    //   .then(response => response.json())
    //   .then(setVeggies(veggies))
    //   .then(console.log(veggies))
    // },[])

    useEffect(() => {
        fetch("/items")
          .then((r) => r.json())
          .then(setItems);
      }, []);


      console.log(user)
      console.log(user.items)
      // console.log(user.items.count)


      

    return (
        <Container text >
          <Divider />
          <center>
            <h1>Hello, {user.name}!</h1>
            
       
           <Statistic>
            <Statistic.Value>
              <CountUp end={items.length > 0 ? (items.filter((item) => item.in_fridge === true).length): 0} duration={2}/>
              </Statistic.Value>
            <Statistic.Label>Items In Your Fridge</Statistic.Label>
          </Statistic>


          <Statistic>
            <Statistic.Value>
              <CountUp end={items.length > 0 ? (items.filter((item) => item.in_freezer === true).length): 0} duration={2} />
            </Statistic.Value>
            <Statistic.Label>Items In Your Freezer</Statistic.Label>
          </Statistic>

          <Statistic>
            <Statistic.Value>
              <CountUp end={items.length > 0 ? (items.filter((item) => item.in_pantry === true).length): 0} duration={2} />
            </Statistic.Value>
            <Statistic.Label>Items In Your Pantry</Statistic.Label>
          </Statistic>

          <Statistic>
            <Statistic.Value>
              <CountUp end={items.length > 0 ? (items.length) : 0}  duration={2}/>
            </Statistic.Value>
            <Statistic.Label>Items In Your Kitchen</Statistic.Label>
          </Statistic>



          <Statistic>
            <Statistic.Value>
              <CountUp end={items.length > 0 ? (items.filter((item) => item.in_shopping_list === true).length): 0} duration={2}/>
              </Statistic.Value>
            <Statistic.Label>Items In Your Shopping List</Statistic.Label>
          </Statistic>
          </center>
            <Accordion>
              <Accordion.Item eventKey="0">
                <h2>Your Kitchen: </h2>
            <Accordion.Header>Your Fridge:</Accordion.Header>
            <Accordion.Body>
            <Card.Group itemsPerRow={2}>
            {items.length > 0 ? (
            items
            .filter((item) => item.in_fridge === true)
            .map(item => <ItemCard  key={item.id} item={ item } setItems={setItems}  />)
             ) : (
            <>
          <p>No items Found.....</p>
          <a href="/NewItem"> <Button>
            Make a New Item
            </Button></a>
          </>
          )}
      </Card.Group>  
      </Accordion.Body>
      </Accordion.Item>
  
      <Accordion.Item eventKey="1">
      
      <Accordion.Header>Your Freezer:</Accordion.Header>
              <Accordion.Body>
            <Card.Group itemsPerRow={2}>
            {items.length > 0 ? (
            items
            .filter((item) => item.in_freezer === true)
            .map(item => <ItemCard key={item.id} setItems={setItems} item={ item }   />)
             ) : (
            <>
          <p>No items Found.....</p>
          <a href="/NewItem"><Button>
            Make a New Item
            </Button></a>
          </>
          )}
      </Card.Group>  
</Accordion.Body> </Accordion.Item>

<Accordion.Item eventKey="2">

           <Accordion.Header> Your Pantry: </Accordion.Header>
           <Accordion.Body>

           <Card.Group itemsPerRow={2}>
            {items.length > 0 ? (
            items
            .filter((item) => item.in_pantry === true)
            .map(item => <ItemCard key={item.id} setItems={setItems} item={ item }   />)
             ) : (
            <>
          <p>No items Found.....</p>
          <a href="/NewItem"><Button>
            Make a New Item
            </Button></a>
          </>
          )}
      </Card.Group>  </Accordion.Body></Accordion.Item>

      <Accordion.Item eventKey="3">

      <Accordion.Header>Your Shopping List:</Accordion.Header>
        <Accordion.Body>
          <Card.Group itemsPerRow={2}>
            {items.length > 0 ? (
            items
            .filter((item) => item.in_shopping_list === true)
            
            .map(item => <ItemCard key={item.id} setItems={setItems} item={ item } />)
             ) : (
            <>
          <p>No items Found.....</p>
          <a href="/NewItem"><Button>
            Make a New Item
            </Button></a>
          </>
          )}
          </Card.Group>  
        </Accordion.Body> 
      </Accordion.Item>        
    </Accordion>
  </Container>
    )
;


}



export default KitchenPage