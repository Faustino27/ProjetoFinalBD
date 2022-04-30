from fastapi import FastAPI
from routes.ataques import ataque
from routes.GruposHackers import gphacker
from routes.tipos import tataque
from fastapi.middleware.cors import CORSMiddleware


app = FastAPI()

app.include_router(ataque)
app.include_router(tataque)
app.include_router(gphacker)

app.add_middleware(
    CORSMiddleware,
    allow_origins = "http://localhost:3000",
    allow_credentials = True,
    allow_methods = ["*"],
    allow_headers= ["*"],
)
