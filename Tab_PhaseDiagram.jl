function Tab_PhaseDiagram()
    html_div([
    # one column for the plots
        dbc_col([
            html_div("‎ "),
            dbc_row([ 

                    dbc_col([diagram_plot()], width=9),
                    dbc_col([  
                        dbc_row([dbc_button("Display options",id="button-display-options"),
                        dbc_collapse(
                            dbc_card(dbc_cardbody([
                                dbc_row([
                                    dbc_col([ 
                                        # html_h1("Hide grid", style = Dict("textAlign" => "center","font-size" => "120%")),
                                    ], width=6),
                                    dbc_col([ 
                                        dcc_checklist(
                                            id      ="show-grid",
                                            options = [
                                                Dict("label" => " Show grid", "value" => "GRID"),
                                            ],
                                            value   = [""],
                                            inline  = true,
                                        ),
                                    ], width=6),
                                ]),
                                html_div("‎ "),
                                dbc_row([
                                    dbc_col([ 
                                        html_h1("Field", style = Dict("textAlign" => "center","font-size" => "120%", "marginTop" => 8)),
                                    ], width=6),
                                    dbc_col([
                                        dcc_dropdown(   id      = "fields-dropdown",
                                                        options = [
                                                            (label = "Variance",                value = "Variance"),
                                                            (label = "Number of stable phases", value = "#Stable_Phases"),
                                                            (label = "G system",                value = "G_system"),
                                                            (label = "Entropy",                 value = "entropy"),
                                                            (label = "Enthalpy",                value = "enthalpy"),
                                                            (label = "Oxygen fugacity",         value = "fO2"),
                                                            (label = "ρ_system",                value = "rho"),
                                                            (label = "ρ_solid",                 value = "rho_S"),
                                                            (label = "ρ_melt",                  value = "rho_M"),
                                                            (label = "Solid fraction",          value = "frac_S"),
                                                            (label = "Melt fraction",           value = "frac_M"),                                                            
                                                            (label = "Vp",                      value = "Vp"),
                                                            (label = "Vs",                      value = "Vs"),
                                                            (label = "Bulk residual (norm)",    value = "bulk_res_norm"),
                                                            (label = "Computation time (ms)",   value = "time_ms"),
                                                            (label = "Status",                  value = "status"),

                                                        ],
                                                        value="Variance" ,
                                                        clearable   = false,
                                                        multi   = false),
                                    ]), 
                                ]),

                                dbc_row([
                                        dbc_col([ 
                                            html_h1("Colormap", style = Dict("textAlign" => "center","font-size" => "120%", "marginTop" => 8)),
                                        ], width=6),
                                        dbc_col([
                                            dcc_dropdown(   id          = "colormaps_cross",
                                                            options     = ["Blackbody","Bluered","Blues","Cividis","Electric","Greens","Greys","Hot","Jet","Picnic","Portland","Rainbow","RdBu","Reds","Viridis","YlGnBu","YlOrRd"],
                                                            value       = "Viridis",
                                                            clearable   = false,
                                                            placeholder = "Colormap")
                                        ]), 
                                    ])
                                ])
                            ),
                            id="collapse",
                            is_open=true,
                        ),

                        dbc_button("Grid refinement",id="button-refinement"),
                        dbc_collapse(
                            dbc_card(dbc_cardbody([
                                    html_div("‎ "),
                                    dbc_row([
                                        dbc_button(
                                            "Refine phase boundaries", id="refine-pb-button", color="light", className="me-2", n_clicks=0,
                                            style       = Dict( "textAlign"     => "center",
                                                                "font-size"     => "100%",
                                                                "border"        =>"1px grey solid")
                                        ),
                                    ]),
                                ])),
                                id="collapse-refinement",
                                is_open=true,
                        ),
                    ])
                    ], width=3),

                ], justify="left"),

            ], width=12)
    ])
end