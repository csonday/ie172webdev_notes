import webbrowser
from multiprocessing import process

import dash
import dash_bootstrap_components as dbc
from dash import Input, Output, State, callback, dcc, html
from dash.exceptions import PreventUpdate

from utilities import generateFibonacci, getFactorial

app = dash.Dash(__name__, external_stylesheets=[dbc.themes.BOOTSTRAP])

app.title = "My First Dash App"

app.layout = html.Div(
    [
        html.Div(
            'Hello World',
            style={'border': '2px solid green'},
            className='w-100 text-center'
        ),
        html.P("My first html.P()", className='placeholder-text'),
        html.P("My second html.P()", className='placeholder-text'),

        html.Div(
            "New div here",
            className='border p-2, m-4'
        ), 
        
        dbc.Row(
            [
                dbc.Col('R1C1, width = 8', width=8, className='border'),
                dbc.Col('R1C2, width = 4', width=4, className='border'),
            ]
        ),
        dbc.Row(
            [
                dbc.Col('R2C1, width = 2', width=2, className='border'),
                dbc.Col('R2C2, width = 2', width=2, className='border'),
            ]
        ),
        
        
        html.Br(),
        html.Div(
            [
                html.Div("box1", className='w-25 border m-auto text-center'),
                html.Div("box2", className='w-25 border m-auto text-center'),
            ], 
            className='d-flex justify-content-between'
        )
    ]
)


if __name__ == '__main__':
    webbrowser.open('http://127.0.0.1:8050', autoraise=True)
    app.run_server()