import streamlit as st
import pandas as pd
import sqlalchemy
from sqlalchemy import create_engine

st.set_page_config(page_title="Sales Dashboard", layout="wide")

@st.cache_resource
def get_engine():
    dev = False
    if dev:
        st.write("Using local database connection")
        return create_engine(st.secrets["db_url_dev"])
    else:
        return create_engine(st.secrets["db_url_prod"])
try:
    engine = get_engine()
    with engine.connect() as conn:
        conn.execute("SELECT 1")
except Exception as e:
    st.error("Database connection failed")
    

@st.cache_data(ttl=60)
def run_query(query):
    return pd.read_sql_query(query, engine)

KEY = "mode"

over25k = st.secrets["over_25k"]
sales_query = st.secrets["sales_query"]
report_sale = st.secrets["report_sale"]
report_region = st.secrets["report_region"]
region_options = run_query(st.secrets["region_options"])["region"].tolist()
query_options = ["Sales Over $25k", "Region Sales Query", "Sales Person Report", "Region Report"]

if KEY not in st.session_state:
    st.session_state[KEY] = None

if "prev_mode" not in st.session_state:
    st.session_state["prev_mode"] = st.session_state[KEY]

def nav_change():
    if st.session_state[KEY] is None:
        st.session_state[KEY] = st.session_state["prev_mode"]
    else:
        st.session_state["prev_mode"] = st.session_state[KEY]


st.title("Sales Dashboard")
selection = st.pills(
    label="Navigation",
    options=query_options,
    key=KEY,
    label_visibility="collapsed",
    width="stretch",
    on_change=nav_change,
)

if selection == "Sales Over $25k":
    st.subheader("Sales Over $25k")
    df = run_query(over25k)
    st.dataframe(df, width="content")

elif selection == "Region Sales Query":
    def clear_selection():
        st.session_state["region_selection"] = []
    st.subheader("Region Sales Query")
    selected_region = st.pills(
        "Filter by Region", 
        options=region_options, 
        selection_mode="multi",
        key="region_selection",)
    st.button("Clear Selection", 
              on_click=lambda:st.session_state.update({"region_selection": []}))
    if len(selected_region) > 1:
        df = run_query(sales_query + f" WHERE region IN {tuple(selected_region)}")
    elif len(selected_region) == 1:
        df = run_query(sales_query + f" WHERE region = '{selected_region[0]}'")
    else:
        df = run_query(sales_query)
    st.dataframe(df, width="content")

elif selection == "Sales Person Report":
    st.subheader("Sales Person Report")
    df = run_query(report_sale)
    st.dataframe(df, width="content")
    
elif selection == "Region Report":
    st.subheader("Region Report")
    df = run_query(report_region)
    st.dataframe(df, width="content")
