import React, { useState } from "react";
import { Card, Image, Button, Popup } from "semantic-ui-react";
import { Popconfirm, message } from 'antd';
import ContentEditable from 'react-contenteditable'
import {AnchorButton, Code, H5, Intent, Switch} from "@blueprintjs/core";
import { Example, handleBooleanChange, IExampleProps } from "@blueprintjs/docs-theme";


function ItemCard({ item, setItems }) {

  const [visible, setVisible] = useState(false);
  const [confirmLoading, setConfirmLoading] = useState(false);



  const handleDelete = () => {
    fetch('/items/' + item.id, {
      method: "Delete",
    })
    .then(console.log(item))
    .then(() => {
      fetch("/items")
      .then((r) => r.json())
      .then(setItems);
    setTimeout(() => {
      setVisible(false);
      setConfirmLoading(false);
    }, 2000);
  })}



  const handleCancel = () => {
    // message.info('Clicked Cancel')
    setVisible(false);
  };


  return (
    <Card>
          
          <Card.Content>
          <Image src={item.imgurl} alt={item.name} floated='right' size='mini'/>
            <Card.Header>{item.name}</Card.Header>
            <Card.Meta>{item.food_group} </Card.Meta>
            <Card.Meta>{item.amount} {item.measurement_type}</Card.Meta>
            <Card.Description>{item.description}</Card.Description>

            </Card.Content>

            <Popup
              trigger={<Button color="blue" icon='delete' content='Delete' />
            }
            content={<Button color='red'  icon='delete' content='Are you sure? This cannot be undone' onClick={handleDelete}/>}
            on='click'
            position='top right'
          />

    </Card>
  );
}

export default ItemCard;