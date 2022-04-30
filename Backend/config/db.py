from sqlalchemy import create_engine, MetaData

engine = create_engine('mysql+pymysql://root:MyN4Sj7eurhhJbJ@localhost:3306/projetofinalbd') #pegar o path
meta = MetaData()
conn = engine.connect()