cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  heartrenal-hypertension-with-end-organ-damage-elixhauser-primary-care---primary:
    run: heartrenal-hypertension-with-end-organ-damage-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  hypertension-with-endorgan-damage-elixhauser-primary-care---primary:
    run: hypertension-with-endorgan-damage-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: heartrenal-hypertension-with-end-organ-damage-elixhauser-primary-care---primary/output
  hypertension-with-end-organ-damage-elixhauser-primary-care-failure---primary:
    run: hypertension-with-end-organ-damage-elixhauser-primary-care-failure---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: hypertension-with-endorgan-damage-elixhauser-primary-care---primary/output
  hypertensive-hypertension-with-end-organ-damage-elixhauser-primary-care---primary:
    run: hypertensive-hypertension-with-end-organ-damage-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: hypertension-with-end-organ-damage-elixhauser-primary-care-failure---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: hypertensive-hypertension-with-end-organ-damage-elixhauser-primary-care---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
