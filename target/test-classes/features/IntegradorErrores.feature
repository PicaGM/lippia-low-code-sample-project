@Errores
Feature: Errores de Trabajo Practico Integrador Crowdar Lippia Low-Code

  @GetWorkspace400
  Scenario: Provocar un fallo 400 cambiando GET por POST
    Given base url https://api.clockify.me
    And endpoint /api/v1/workspaces
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method POST
    Then the status code should be 400

  @GetWorkspace401
  Scenario: Proocar un fallo 401 con una Api key incorrecta
    Given base url https://api.clockify.me
    And endpoint /api/v1/workspaces
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliY
    When execute method GET
    Then the status code should be 401

  @GetWorkspace404
  Scenario: Provocar un error 404 entregando un Endpoint erroneo
    Given base url https://api.clockify.me
    And endpoint /api/v1/workspace
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method GET
    Then the status code should be 404

  @GetProjects400
  Scenario: Provocar un error 400 cambiando GET por POST
    Given call Integrador.feature@GetWorkspace
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method POST
    Then the status code should be 400

  @GetProjects401
  Scenario: Provocar un error 401 escribiendo mal x-api-key
    Given call Integrador.feature@GetWorkspace
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects
    And header Content-Type = application/json
    And header Accept = */*
    And header xapikey = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method GET
    Then the status code should be 401

  @GetProjects404
  Scenario: Provocar un error 404 entregando un Endpoint erroneo
    Given call Integrador.feature@GetWorkspace
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projectos
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method GET
    Then the status code should be 404

  @GetTimeEntry400
  Scenario: Provocar un error 400 cambiando GET por POST
    Given call Integrador.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/user/{{userId}}/time-entries
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method POST
    Then the status code should be 400

  @GetTimeEntry401
  Scenario: Provocar un error 401 borrando la Api key
    Given call Integrador.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/user/{{userId}}/time-entries
    And header Content-Type = application/json
    And header Accept = */*
    When execute method GET
    Then the status code should be 401

  @GetTimeEntry404
  Scenario: Provocar un error 404 entregando un Endpoint erroneo
    Given call Integrador.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/user/{{userId}}/time
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method GET
    Then the status code should be 404

  @AddHours400
  Scenario: Provocar un error 400 borrando el body
    Given call Integrador.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/user/{{userId}}/time-entries
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method POST
    Then the status code should be 400

  @AddHours401
  Scenario: Provocar un error 401 entregando mal la Api key
    Given call Integrador.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/user/{{userId}}/time-entries
    And header Content-Type = application/json
    And header Accept = */*
    And header X-API-KEI = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    And body hours.json
    When execute method POST
    Then the status code should be 401

  @AddHours404
  Scenario: Provocar un error 404 enviando un Endpoint incorrecto
    Given call Integrador.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/user/{{userId}}/timeentries
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    And body hours.json
    When execute method POST
    Then the status code should be 404

  @EditTimeEntry400
  Scenario: Provocar un error 400 eliminando el body
    Given call Integrador.feature@GetTimeEntry
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/time-entries/{{timeId}}
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method PUT
    Then the status code should be 400

  @EditTimeEntry401
  Scenario: Provocar un error 401 borrando la X de x-api-key
    Given call Integrador.feature@GetTimeEntry
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/time-entries/{{timeId}}
    And header Content-Type = application/json
    And header Accept = */*
    And header api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    And body time.json
    When execute method PUT
    Then the status code should be 401

  @EditTimeEntry404
  Scenario: Provocar un error 404 cambiando el Endpoint por v2
    Given call Integrador.feature@GetTimeEntry
    And base url https://api.clockify.me/api
    And endpoint /v2/workspaces/{{workspaceId}}/time-entries/{{timeId}}
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    And body time.json
    When execute method PUT
    Then the status code should be 404

  @DeleteTimeEntry400
  Scenario: Provocar un error 400 cambiando el id del Endpoint
    Given call Integrador.feature@GetTimeEntry
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/time-entries/{{userId}}
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method DELETE
    Then the status code should be 400

  @DeleteTimeEntry401
  Scenario: Provocar un error 401 modificando el nombre de Api key
    Given call Integrador.feature@GetTimeEntry
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/time-entries/{{timeId}}
    And header Content-Type = application/json
    And header Accept = */*
    And header YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2 = key-api-x
    When execute method DELETE
    Then the status code should be 401

  @DeleteTimeEntry404
  Scenario: Provocar un error 404 borrando parte del Endpoint
    Given call Integrador.feature@GetTimeEntry
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/{{timeId}}
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method DELETE
    Then the status code should be 404
