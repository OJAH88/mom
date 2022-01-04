import {combineReducers} from 'react-redux'
import UserReducer from './reducer-users'

const allReducers = combineReducers({
    users: UserReducer
})
