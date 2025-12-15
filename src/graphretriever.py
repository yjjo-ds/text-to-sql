from dotenv import load_dotenv
from langchain_openai import ChatOpenAI
from neo4j import GraphDatabase
from neo4j_graphrag.retrievers import Text2CypherRetriever
load_dotenv()

neo4j_schema = """
Table {name: STRING, description: STRING}
Column {name: STRING, description: STRING, primary_key: STRING}
Value {value: STRING}
Relationship properties:
The relationships:
(:Column)-[:HAS_VALUE]->(:Value)
(:Table)-[:HAS_COLUMN]->(:Column)
"""
URI = "neo4j+s://c28beaa7.databases.neo4j.io"
AUTH = ("neo4j", "Dc1bDOOI1SWsMZ_C50H3qUbv6F2_mymXaqeNJZ_dITs")

# Connect to Neo4j database
driver = GraphDatabase.driver(URI, auth=AUTH)
driver

llm = ChatOpenAI(model="gpt-4o-mini")
retriever = Text2CypherRetriever(
    driver=driver,
    llm=llm,  # type: ignore
    neo4j_schema=neo4j_schema,
    # examples=examples,
)


query_text = "Value 에 쿠팡이 있는 컬럼을 찾아줘"
result = retriever.search(query_text=query_text)
print(result)
print(result.metadata["cypher"])
