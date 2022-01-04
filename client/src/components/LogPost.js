import { useState, useEffect } from "react"
import React, { useHistory, useParams } from "react-router"
import {Container, Form, Input, TextArea, Button, Select , Icon, Checkbox, Feed} from 'semantic-ui-react'
import FoodLogCard from "../components/FoodLogCard"
import useFetch from "../components/useFetch"

export default function LogPost({food_log, handleDelete}) {

    return(
        <Container>
            <Feed>
                <Feed.Event>
                    <Feed.Label>
                        <img src="https://react.semantic-ui.com/images/avatar/small/elliot.jpg"/>
                    </Feed.Label>
                </Feed.Event>

            </Feed>
        </Container>
    )
}