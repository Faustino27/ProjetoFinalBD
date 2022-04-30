from pydantic import BaseModel

class Ataque(BaseModel):
    nome: str
    CVSS: str
    Porta: int
    Tipo: str
class TipoAtaque(BaseModel):
    codigo:str
    info: str
    infra: str
class GrupoHacker(BaseModel):
    nome: str
    pais: str
    risco: int
    sigla: str
    sigla_cont: str
