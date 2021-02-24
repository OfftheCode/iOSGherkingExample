Feature: Recommending Products
  Users with hobbys matching our products should have these products recommended

  Scenario Outline: Recommend products which names match hobby
    Given user have <hobby>
    When product name is <product_name>
    Then product should be <recommended>

    Examples:
      | hobby | product_name     | recommended |
      | Plant | Super Plant      | true        |
      | Music | Amazing Juice    | false       |
      | plant | Futuristic plant | true        |
