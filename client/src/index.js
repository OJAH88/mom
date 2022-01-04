import React from 'react';
import {BrowserRouter} from 'react-router-dom'
import ReactDOM from 'react-dom';
import './index.css';
import App from './components/App'
// import "antd/dist/antd.css";
import CssBaseline from '@mui/material/CssBaseline';
import "semantic-ui-css/semantic.min.css";
import 'bootstrap/dist/css/bootstrap.min.css';
// import { createStore } from 'redux'
// import allReducers from './reducers'

// const store = createStore();


ReactDOM.render(
  <BrowserRouter>
    <App />
  </BrowserRouter>,
  document.getElementById('root')
);

