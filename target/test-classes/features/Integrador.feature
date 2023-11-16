@Integrador
Feature: Trabajo Practico Integrador Crowdar Lippia Low-Code

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2

  @GetWorkspace
  Scenario: Obtener los Workspace
    Given base url https://api.clockify.me
    And endpoint /api/v1/workspaces
    When execute method GET
    Then the status code should be 200
    * define workspaceId = $.[0].id

  @GetProjects
  Scenario: Buscar los todos proyectos en el Workspace
    Given call Integrador.feature@GetWorkspace
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects
    When execute method GET
    Then the status code should be 200
    * define projectId = $.[0].id
    * define userId = $.[0].memberships[0].userId

  @GetTimeEntry
  Scenario: Buscar un time entry en el Workspace
    Given call Integrador.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/user/{{userId}}/time-entries
    When execute method GET
    Then the status code should be 200
    * define timeId = $.[0].id

  @AddHours
  Scenario: Añadir horas a un proyecto del workspace
    Given call Integrador.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/user/{{userId}}/time-entries
    And body hours.json
    When execute method POST
    Then the status code should be 201

  @EditTimeEntry
  Scenario: Editar las horas de un time entry
    Given call Integrador.feature@GetTimeEntry
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/time-entries/{{timeId}}
    And body time.json
    When execute method PUT
    Then the status code should be 200

  @DeleteTimeEntry
  Scenario: Borrar el time entry de un proyecto
    Given call Integrador.feature@GetTimeEntry
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/time-entries/{{timeId}}
    When execute method DELETE
    Then the status code should be 204