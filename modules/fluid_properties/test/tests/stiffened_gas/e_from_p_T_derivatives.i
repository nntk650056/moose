[Mesh]
  type = GeneratedMesh
  dim = 1
  nx = 1
[]

[Variables]
  [./p]
    initial_condition = 2.0
  [../]
  [./T]
    initial_condition = 3.0
  [../]
[]

[Modules]
  [./FluidProperties]
    [./fp]
      type = StiffenedGasFluidProperties
      gamma = 1.5
      q = -10.0
      q_prime = 5.0
      p_inf = 2.0
      cv = 2.0
      mu = 4.0
      k = 3.0
    [../]
  []
[]

[Kernels]
  [./test_kernel]
    type = InternalEnergyFromPressureTemperatureDerivativesTestKernel
    variable = p
    fluid_properties = fp
    p = p
    T = T
  [../]
[]

[Problem]
  kernel_coverage_check = false
[]

[Preconditioning]
  [./preconditioner]
    type = SMP
    full = true
    solve_type = NEWTON
    petsc_options_iname = '-snes_type -snes_test_err'
    petsc_options_value = 'test       1e-8'
  [../]
[]

[Executioner]
  type = Steady
[]
