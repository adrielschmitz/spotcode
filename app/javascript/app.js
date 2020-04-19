import React from 'react'
import 'react-bulma-components/dist/react-bulma-components.min.css'
import Routes from './routes'
import { BrowserRouter } from 'react-router-dom'
import 'app.scss'
import Menu from './components/common/menu'

const App = () => {
  return (
    <>
      <BrowserRouter>
        <Menu/>
        <Routes/>
      </BrowserRouter>
    </>
  )
}

export default App
