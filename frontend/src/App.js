import {AppBar,Box ,Toolbar, Button, TableContainer, Table, TableRow, TableCell, TableBody, TextField} from '@mui/material';
import {useState} from 'react'
import axios from 'axios'

function App() {

  const [ataques, setAtaques] = useState([])
  const [ataque, setAtaque] = useState({})
  const fetchAtaques = async () =>{
    const response = await axios.get(`http://localhost:8000/ataques/Lista_ataques_ataques__get`)
    return setAtaques(response.data)
  }
  const fetchAtaque = async (Nome) =>{
    const response = await axios.get(`http://localhost:8000/${Nome}`)
    return setAtaque(response.data)
  }
  //fetchAtaques()
  //fetchAtaque()
  const CreateOrEditarAtaque = async () =>{
    if(ataque.Nome){
      await axios.put(`http://localhost:8000/${ataque.Nome}`, ataque)
    }else{
      await axios.post(`http://localhost:8000/`, ataque)
    }
    await fetchAtaques()
    await setAtaque({Nome:'', Tipo_de_Ataque_Codigo: '', CVSS_CVE: '', Porta_Destino: 0})
    //return setAtaque(response.data)
  }
  const deleteAtaque = async (Nome) =>{
    await axios.delete(`http://localhost:8000/${Nome}`)
    await fetchAtaques()
  }
  return (
    <div>
    <AppBar position="static">
      <Toolbar variant="dense">
        <Button color="inherit">Ataque</Button>
      </Toolbar>
    </AppBar>
    
    <Box m = {10}>
    <Button onClick={()=> fetchAtaques()} variant = "contained" coloar = "primary">
                  X
          </Button>
      <TableContainer>
        <Table aria-label = "ataque">
          <TableBody>
          <TableRow>
              <TableCell>
                <TextField value = {ataque.Nome} onChange={(e)=> setAtaque({...ataque, Nome:e.target.value})} id="outlined-basic" label="Nome" variant="outlined" />
              </TableCell>
              <TableCell>
                <TextField value = {ataque.Tipo_de_Ataque_Codigo} onChange={(e)=> setAtaque({...ataque, Tipo_de_Ataque_Codigo:e.target.value})} id="outlined-basic" label="Tipo de Ataque" variant="outlined" />
              </TableCell>
              <TableCell>
                <TextField value = {ataque.CVSS_CVE} onChange={(e)=> setAtaque({...ataque, CVSS_CVE:e.target.value})} id="outlined-basic" label="CVSS CVE" variant="outlined" />
              </TableCell>
              <TableCell>
                <TextField value = {ataque.Porta_Destino} onChange={(e)=> setAtaque({...ataque, Porta_Destino:e.target.value})} id="outlined-basic" label="Porta Destino" variant="outlined" />
              </TableCell>
              <TableCell>
                <Button onClick={()=> CreateOrEditarAtaque()} variant = "contained" coloar = "primary">
                  Enviar
                </Button>
              </TableCell>
            </TableRow>

            <TableRow>
              <TableCell>Nome</TableCell>
              <TableCell>Tipo de Ataque Codigo</TableCell>
              <TableCell>CVSS CVE</TableCell>
              <TableCell>Porta Destino</TableCell>
              <TableCell>Editar</TableCell>
              <TableCell>Deletar</TableCell>
            </TableRow>
            {ataques.map((row) => (
              <TableRow key={row.nome}>
                <TableCell>{row.nome}</TableCell>
                <TableCell>{row.Tipo_de_Ataque_Codigo}</TableCell>
                <TableCell>{row.CVSS_CVE}</TableCell>
                <TableCell>{row.Porta_Destino}</TableCell>
                <TableCell>
                  <Button onClick={()=> fetchAtaque(row.Nome)} variant = "contained" color = "primary">
                    Editar
                  </Button>
                  </TableCell>
                <TableCell>
                  <Button onClick={()=> deleteAtaque(row.Nome)} variant = "contained" color = "secundary">
                    Deletar
                  </Button>
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>

    </Box>
    </div>
  );
}

export default App;
