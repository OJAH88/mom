import { useState, useEffect } from "react"
import React, { useHistory, useParams } from "react-router"
import {Form, Input, TextArea, Button, Select , Icon, Checkbox, Dropdown, Container, Message} from 'semantic-ui-react'
import ItemForm from '../components/ItemForm'
import useFetch from "../components/useFetch"



function NewItem ({ myKitchen}) {
  const {id} = useParams()
  const { data: item, error, isLoading } = useFetch('items/' + id) 
  const [user, setUser] = useState("")
  const [items, setItems] = useState([])
  const [veggies, setVeggies] = useState([])
  const [visible, setVisible] = useState(false);
  const [confirmLoading, setConfirmLoading] = useState(false);
  const [errors, setErrors] = useState([]);
  const [isChecked, setIsChecked] = useState(false);
  const [isLoading2, setIsLoading] = useState(false);
  const history = useHistory();
  const [name, setName] = useState('')
  const [food_group, setFoodGroup] = useState('')
  const [description, setDescription] = useState('')
  const [imgurl, setImgurl] = useState('')
  const [amount, setAmount] = useState('')
  const [measurement_type, setMeasurementType] = useState('')
  const [in_kitchen, setInKitchen] = useState(false)
  const [in_fridge, setInFridge] = useState(false)
  const [in_freezer, setInFreezer] = useState(false)
  const [in_pantry, setInPantry] = useState(false)
  const [in_shopping_list, setInShoppingList] = useState(false)
  const options = [
    { key: 'Fruit', text: 'Fruit', value: 'Fruit' },
    { key: 'Vegetable', text: 'Vegetable', value: 'Vegetable'},
    { key: 'Protein', text: 'Protein', value: 'Protein'},
    { key: 'Grains', text: 'Grains', value: 'Grains'},
    { key: 'Dairy', text: 'Dairy', value: 'Dairy' },
    { key: 'Carbohydrates', text: 'Carbohydrates', value: 'Carbohydrates' },
    { key: 'Snacks', text: 'Snacks', value: 'Snacks' },
  ]


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
        .then(setItems);
    }, []);
    
  function handleSubmit(e) {
    e.preventDefault();
    const newItem = { name, food_group, description, imgurl, amount, measurement_type, in_kitchen, in_fridge, in_freezer, in_pantry, in_shopping_list }
    setIsLoading(true);
   
      fetch('/items', {
          method: 'POST',
          headers: { "Content-Type" : "application/json"},
          body: JSON.stringify(newItem)
      }).then(() => {
          console.log('New Item Added!!')
          setIsLoading(false)
          history.push('/')
      })

  }

  function handleFridgeCheckbox() {
    setInFridge(!in_fridge);
    setInKitchen(!in_kitchen);
  }

  function handleFreezerCheckbox(){
    setInFreezer(!in_freezer);
    setInKitchen(!in_kitchen);
  }

  function handlePantryCheckbox() {
    setInPantry(!in_pantry)
    setInKitchen(!in_kitchen);
  }

  function handleShoppingListCheckbox() {
    setInShoppingList(!in_shopping_list)
  }

  return (
    <Container text>
      <h3>Make A New Item</h3>
      <Form onSubmit={handleSubmit} >
        <Form.Group widths='equal'>
           <Form.Input required fluid label='Item Name' placeholder='Item Name' value={name} onChange={(e) => setName(e.target.value)}  />
           <Form.Select
            fluid
            label='Food Group'
            options={options}
            placeholder='Select Food Group'
          />
           
        </Form.Group>

        <Form.TextArea fluid label='Item Description' placeholder='Item Description' value={description} onChange={(e) => setDescription(e.target.value)}  />

        <Form.Group widths='equal'>
        

          <Form.Input fluid label='Image URL' placeholder='Image URL' value={imgurl} onChange={(e) => setImgurl(e.target.value)}  />
          <Form.Input fluid label='Amount' type='number' placeholder='#' value={amount} onChange={(e) => setAmount(e.target.value)} />
          <Form.Input fluid label='Measurement Type' placeholder='Measurement Type' value={measurement_type} onChange={(e) => setMeasurementType(e.target.value)} />
          
             
        </Form.Group>
        <Form.Group widths="equal">
          <Checkbox toggle label="Add To Fridge" value={in_fridge} onChange={handleFridgeCheckbox} />
        </Form.Group>

        <Form.Group widths="equal">
          <Checkbox toggle label="Add To Freezer" value={in_freezer} onChange={handleFreezerCheckbox} />
        </Form.Group>

        <Form.Group widths="equal">
         <Checkbox toggle label="Add To Pantry" value={in_pantry} onChange={handlePantryCheckbox} />
        </Form.Group>

        <Form.Group widths="equal">
          <Checkbox toggle label="Add To Shopping List" value={in_shopping_list} onChange={handleShoppingListCheckbox} />
        </Form.Group>
        <Message
      error
      header='Action Forbidden'
      content="You need a name......."
    />


        <Button color="blue" type="submit">Submit</Button>
      </Form>

    </Container>
   );
  
}

export default NewItem