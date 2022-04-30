from fastapi import APIRouter, Depends
from models.user import grupoH
from config.db import conn
from schemas.classes import GrupoHacker
gphacker = APIRouter(
    prefix = "/GruposHackers",
    tags =["GruposHackers"],
    #responses = {404: {"Description": "Not found"}}

)

@gphacker.get('/')
async def Lista_Grupos():
    return conn.execute(grupoH.select()).fetchall()
@gphacker.get('/{Nome}')
async def find_Grupo(nome: str):
    return conn.execute(grupoH.select().where(grupoH.c.Nome == nome)).first()
@gphacker.post('/')
async def create_Grupo(Grupo: GrupoHacker):
    conn.execute(grupoH.insert().values(
        Nome = Grupo.nome,
        Pais = Grupo.pais,
        Risco = Grupo.risco,
        Continente_Sigla = Grupo.sigla_cont,
        Sigla = Grupo.sigla
    ))
    return conn.execute(grupoH.select()).fetchall
@gphacker.put('/{Nome}')
async def update_Grupo(nome: str, Grupo: GrupoHacker):
    return conn.execute(grupoH.update().values(
        Nome = Grupo.nome,
        Pais = Grupo.pais,
        Risco = Grupo.risco,
        Continente_Sigla = Grupo.sigla_cont,
        Sigla = Grupo.sigla
    ).where(grupoH.c.Nome == nome))
@gphacker.delete('/{Nome}')
async def fetch_Grupo(nome: str):
    conn.execute(grupoH.delete().where(grupoH.c.Nome == nome))
    return conn.execute(grupoH.select()).fetchall