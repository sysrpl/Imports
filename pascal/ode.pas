(********************************************************)
(*                                                      *)
(*  Open Dynamics Engine                                *)
(*  from v0.16.6 published on 2025-01-16                *)
(*                                                      *)
(*  Free Pascal interface by admin@getlazarus.org       *)
(*  https://www.getlazarus.org                          *)
(*                                                      *)
(*  Published under the zlib license                    *)
(*                                                      *)
(********************************************************)
unit ODE;

{$mode delphi}
{$warn 3187 off : C arrays are passed by reference}

interface

const
  ODEVersion = 'v0.16.6';

type
  dint64 = Int64;
  duint64 = UInt64;
  dint32 = Integer;
  duint32 = Cardinal;
  dint16 = SmallInt;
  duint16 = Word;
  dint8 = ShortInt;
  duint8 = Byte;

  dintptr = dint64;
  duintptr = duint64;
  ddiffint = dint64;
  dsizeint = duint64;

  dMessageFunction = procedure(errnum: Integer; msg: PChar; ap: Pointer); cdecl;

procedure dSetErrorHandler(fn: dMessageFunction); cdecl; external;
procedure dSetDebugHandler(fn: dMessageFunction); cdecl; external;
procedure dSetMessageHandler(fn: dMessageFunction); cdecl; external;
function dGetErrorHandler: dMessageFunction; cdecl; external;
function dGetDebugHandler: dMessageFunction; cdecl; external;
function dGetMessageHandler: dMessageFunction; cdecl; external;
procedure dError(num: Integer; msg: PChar); cdecl; external;
procedure dDebug(num: Integer; msg: PChar); cdecl; external;
procedure dMessage(num: Integer; msg: PChar); cdecl; external;

type
  dReal = Single;
  PdReal = ^dReal;
  dTriIndex = duint32;
  PdTriIndex = ^dTriIndex;

  dVector3 = array[0..3] of dReal;
  dVector4 = array[0..3] of dReal;
  dMatrix3 = array[0..8] of dReal;
  dMatrix4 = array[0..15] of dReal;
  dQuaternion = array[0..3] of dReal;

  dxWorld = record end;
  dxSpace = record end;
  dxBody = record end;
  dxGeom = record end;
  dxJoint = record end;
  dxJointGroup = record end;

  dWorld = ^dxWorld;
  dSpace = ^dxSpace;
  dBody = ^dxBody;
  dGeom = ^dxGeom;
  dJoint = ^dxJoint;
  dJointGroup = ^dxJointGroup;

const
  d_ERR_UNKNOWN = 0;
  d_ERR_IASSERT = 1;
  d_ERR_UASSERT = 2;
  d_ERR_LCP = 3;

type
  dJointType = (
    dJointTypeNone = 0,
    dJointTypeBall,
    dJointTypeHinge,
    dJointTypeSlider,
    dJointTypeContact,
    dJointTypeUniversal,
    dJointTypeHinge2,
    dJointTypeFixed,
    dJointTypeNull,
    dJointTypeAMotor,
    dJointTypeLMotor,
    dJointTypePlane2D,
    dJointTypePR,
    dJointTypePU,
    dJointTypePiston,
    dJointTypeDBall,
    dJointTypeDHinge,
    dJointTypeTransmission
  );

const
  dParamLoStop = 0;
  dParamHiStop = 1;
  dParamVel = 2;
  dParamLoVel = 3;
  dParamHiVel = 4;
  dParamFMax = 5;
  dParamFudgeFactor = 6;
  dParamBounce = 7;
  dParamCFM = 8;
  dParamStopERP = 9;
  dParamStopCFM = 10;
  dParamSuspensionERP = 11;
  dParamSuspensionCFM = 12;
  dParamERP = 13;
  dParamsInGroup = 14;

  dParamGroup1 = $000;
  dParamLoStop1 = $000;
  dParamHiStop1 = $001;
  dParamVel1 = $002;
  dParamLoVel1 = $003;
  dParamHiVel1 = $004;
  dParamFMax1 = $005;
  dParamFudgeFactor1 = $006;
  dParamBounce1 = $007;
  dParamCFM1 = $008;
  dParamStopERP1 = $009;
  dParamStopCFM1 = $00A;
  dParamSuspensionERP1 = $00B;
  dParamSuspensionCFM1 = $00C;
  dParamERP1 = $00D;

  dParamGroup2 = $100;
  dParamLoStop2 = $100;
  dParamHiStop2 = $101;
  dParamVel2 = $102;
  dParamLoVel2 = $103;
  dParamHiVel2 = $104;
  dParamFMax2 = $105;
  dParamFudgeFactor2 = $106;
  dParamBounce2 = $107;
  dParamCFM2 = $108;
  dParamStopERP2 = $109;
  dParamStopCFM2 = $10A;
  dParamSuspensionERP2 = $10B;
  dParamSuspensionCFM2 = $10C;
  dParamERP2 = $10D;

  dParamGroup3 = $200;
  dParamLoStop3 = $200;
  dParamHiStop3 = $201;
  dParamVel3 = $202;
  dParamLoVel3 = $203;
  dParamHiVel3 = $204;
  dParamFMax3 = $205;
  dParamFudgeFactor3 = $206;
  dParamBounce3 = $207;
  dParamCFM3 = $208;
  dParamStopERP3 = $209;
  dParamStopCFM3 = $20A;
  dParamSuspensionERP3 = $20B;
  dParamSuspensionCFM3 = $20C;
  dParamERP3 = $20D;

  dParamGroup = $100;

const
  dAMotorUser = 0;
  dAMotorEuler = 1;

  dTransmissionParallelAxes = 0;
  dTransmissionIntersectingAxes = 1;
  dTransmissionChainDrive = 2;

type
  dJointFeedback = record
    f1: dVector3;
    t1: dVector3;
    f2: dVector3;
    t2: dVector3;
  end;
  PdJointFeedback = ^dJointFeedback;

procedure dGeomMoved(geom: dGeom); cdecl; external;
function dGeomGetBodyNext(geom: dGeom): dGeom; cdecl; external;
function dGetConfiguration: PChar; cdecl; external;
function dCheckConfiguration(token: PChar): Integer; cdecl; external;

type
  dInitODEFlags = (
    dInitFlagManualThreadCleanup = $00000001
  );

procedure dInitODE; cdecl; external;
function dInitODE2(uiInitFlags: Cardinal): Integer; cdecl; external;

const
  dAllocateFlagBasicData = 0;
  dAllocateFlagCollisionData = $00000001;
  dAllocateMaskAll = not 0;

function dAllocateODEDataForThread(uiAllocateFlags: Cardinal): Integer; cdecl; external;
procedure dCleanupODEAllDataForThread; cdecl; external;
procedure dCloseODE; cdecl; external;

const
  dContactMu2 = $001;
  dContactAxisDep = $001;
  dContactFDir1 = $002;
  dContactBounce = $004;
  dContactSoftERP = $008;
  dContactSoftCFM = $010;
  dContactMotion1 = $020;
  dContactMotion2 = $040;
  dContactMotionN = $080;
  dContactSlip1 = $100;
  dContactSlip2 = $200;
  dContactRolling = $400;
  dContactInelastic = $800;
  dContactApprox0 = $0000;
  dContactApprox1_1 = $1000;
  dContactApprox1_2 = $2000;
  dContactApprox1_N = $4000;
  dContactApprox1 = $7000;

type
  dSurfaceParameters = record
    mode: Integer;
    mu: dReal;
    mu2: dReal;
    rho: dReal;
    rho2: dReal;
    rhoN: dReal;
    bounce: dReal;
    bounce_vel: dReal;
    soft_erp: dReal;
    soft_cfm: dReal;
    motion1: dReal;
    motion2: dReal;
    motionN: dReal;
    slip1: dReal;
    slip2: dReal;
    inward_force_limit: dReal;
  end;

  dContactGeom = record
    pos: dVector3;
    normal: dVector3;
    depth: dReal;
    g1, g2: dGeom;
    side1, side2: Integer;
  end;

  dContact = record
    surface: dSurfaceParameters;
    geom: dContactGeom;
    fdir1: dVector3;
  end;

  dAllocFunction = function(size: dsizeint): Pointer; cdecl;
  dReallocFunction = function(ptr: Pointer; oldsize, newsize: dsizeint): Pointer; cdecl;
  dFreeFunction = procedure(ptr: Pointer; size: dsizeint); cdecl;

procedure dSetAllocHandler(fn: dAllocFunction); cdecl; external;
procedure dSetReallocHandler(fn: dReallocFunction); cdecl; external;
procedure dSetFreeHandler(fn: dFreeFunction); cdecl; external;
function dGetAllocHandler: dAllocFunction; cdecl; external;
function dGetReallocHandler: dReallocFunction; cdecl; external;
function dGetFreeHandler: dFreeFunction; cdecl; external;
function dAlloc(size: dsizeint): Pointer; cdecl; external;
function dRealloc(ptr: Pointer; oldsize, newsize: dsizeint): Pointer; cdecl; external;
procedure dFree(ptr: Pointer; size: dsizeint); cdecl; external;

function dSafeNormalize3(var a: dVector3): Integer; cdecl; external;
function dSafeNormalize4(var a: dVector4): Integer; cdecl; external;
procedure dNormalize3(var a: dVector3); cdecl; external;
procedure dNormalize4(var a: dVector4); cdecl; external;
procedure dPlaneSpace(const n: dVector3; var p, q: dVector3); cdecl; external;
function dOrthogonalizeR(var m: dMatrix3): Integer; cdecl; external;

procedure dSetZero(a: PDouble; n: Integer); cdecl; external;
procedure dSetValue(a: PDouble; n: Integer; value: dReal); cdecl; external;
function dDot(const a, b: PDouble; n: Integer): dReal; cdecl; external;

procedure dMultiply0(A: PDouble; const B, C: PDouble; p, q, r: Integer); cdecl; external;
procedure dMultiply1(A: PDouble; const B, C: PDouble; p, q, r: Integer); cdecl; external;
procedure dMultiply2(A: PDouble; const B, C: PDouble; p, q, r: Integer); cdecl; external;

function dFactorCholesky(A: PDouble; n: Integer): Integer; cdecl; external;
procedure dSolveCholesky(const L: PDouble; b: PDouble; n: Integer); cdecl; external;
function dInvertPDMatrix(const A: PDouble; Ainv: PDouble; n: Integer): Integer; cdecl; external;
function dIsPositiveDefinite(const A: PDouble; n: Integer): Integer; cdecl; external;
procedure dFactorLDLT(A, d: PDouble; n, nskip: Integer); cdecl; external;
procedure dSolveL1(const L: PDouble; b: PDouble; n, nskip: Integer); cdecl; external;
procedure dSolveL1T(const L: PDouble; b: PDouble; n, nskip: Integer); cdecl; external;
procedure dScaleVector(a: PDouble; const d: PDouble; n: Integer); cdecl; external;
procedure dVectorScale(a: PDouble; const d: PDouble; n: Integer); cdecl; external; deprecated;
procedure dSolveLDLT(const L, d: PDouble; b: PDouble; n, nskip: Integer); cdecl; external;
procedure dLDLTAddTL(L, d: PDouble; const a: PDouble; n, nskip: Integer); cdecl; external;
procedure dLDLTRemove(A: PPointer; const p: PInteger; L, d: PDouble; n1, n2, r, nskip: Integer); cdecl; external;
procedure dRemoveRowCol(A: PDouble; n, nskip, r: Integer); cdecl; external;

type
  dxThreadingImplementation = record end;
  dThreadingImplementation = ^dxThreadingImplementation;
  dmutexindex_t = Cardinal;

  dxMutexGroup = record end;
  dMutexGroup = ^dxMutexGroup;

  dMutexGroupAllocFunction = function(impl: dThreadingImplementation; Mutex_count: dmutexindex_t; const Mutex_names_ptr: PPChar): dMutexGroup; cdecl;
  dMutexGroupFreeFunction = procedure(impl: dThreadingImplementation; mutex_group: dMutexGroup); cdecl;
  dMutexGroupMutexLockFunction = procedure(impl: dThreadingImplementation; mutex_group: dMutexGroup; mutex_index: dmutexindex_t); cdecl;
  dMutexGroupMutexUnlockFunction = procedure(impl: dThreadingImplementation; mutex_group: dMutexGroup; mutex_index: dmutexindex_t); cdecl;

  dxCallReleasee = record end;
  dCallReleasee = ^dxCallReleasee;

  dxCallWait = record end;
  dCallWait = ^dxCallWait;

  ddependencycount_t = dsizeint;
  ddependencychange_t = ddiffint;
  dcallindex_t = dsizeint;

  dThreadedCallFunction = function(call_context: Pointer; instance_index: dcallindex_t; this_releasee: dCallReleasee): Integer; cdecl;

  dThreadedWaitTime = record
    wait_sec: Int64;
    wait_nsec: Cardinal;
  end;

  PdCallReleasee = Pointer;
  PdThreadedWaitTime = Pointer;

  dThreadedCallWaitAllocFunction = function(impl: dThreadingImplementation): dCallWait; cdecl;
  dThreadedCallWaitResetFunction = procedure(impl: dThreadingImplementation; call_wait: dCallWait); cdecl;
  dThreadedCallWaitFreeFunction = procedure(impl: dThreadingImplementation; call_wait: dCallWait); cdecl;
  dThreadedCallPostFunction = procedure(impl: dThreadingImplementation; out_summary_fault: PInteger; out_post_releasee: PdCallReleasee;
    dependencies_count: ddependencycount_t; dependent_releasee: dCallReleasee; call_wait: dCallWait;
    call_func: dThreadedCallFunction; call_context: Pointer; instance_index: dcallindex_t; const call_name: PChar); cdecl;
  dThreadedCallDependenciesCountAlterFunction = procedure(impl: dThreadingImplementation; target_releasee: dCallReleasee;
    dependencies_count_change: ddependencychange_t); cdecl;
  dThreadedCallWaitFunction = procedure(impl: dThreadingImplementation; out_wait_status: PInteger;
    call_wait: dCallWait; const timeout_time_ptr: PdThreadedWaitTime; const wait_name: PChar); cdecl;

  dThreadingImplThreadCountRetrieveFunction = function(impl: dThreadingImplementation): Cardinal; cdecl;
  dThreadingImplResourcesForCallsPreallocateFunction = function(impl: dThreadingImplementation;
    max_simultaneous_calls_estimate: ddependencycount_t): Integer; cdecl;

  dThreadingFunctionsInfo = record
    struct_size: Cardinal;
    alloc_mutex_group: dMutexGroupAllocFunction;
    free_mutex_group: dMutexGroupFreeFunction;
    lock_group_mutex: dMutexGroupMutexLockFunction;
    unlock_group_mutex: dMutexGroupMutexUnlockFunction;
    alloc_call_wait: dThreadedCallWaitAllocFunction;
    reset_call_wait: dThreadedCallWaitResetFunction;
    free_call_wait: dThreadedCallWaitFreeFunction;
    post_call: dThreadedCallPostFunction;
    alter_call_dependencies_count: dThreadedCallDependenciesCountAlterFunction;
    wait_call: dThreadedCallWaitFunction;
    retrieve_thread_count: dThreadingImplThreadCountRetrieveFunction;
    preallocate_resources_for_calls: dThreadingImplResourcesForCallsPreallocateFunction;
  end;
  PdThreadingFunctionsInfo = ^dThreadingFunctionsInfo;

  dxCooperative = record end;
  dxResourceRequirements = record end;
  dxResourceContainer = record end;

  dCooperative = ^dxCooperative;
  dResourceRequirements = ^dxResourceRequirements;
  dResourceContainer = ^dxResourceContainer;

function dCooperativeCreate(const functionInfo: PdThreadingFunctionsInfo; threadingImpl: dThreadingImplementation): dCooperative; cdecl; external;
procedure dCooperativeDestroy(cooperative: dCooperative); cdecl; external;

function dResourceRequirementsCreate(cooperative: dCooperative): dResourceRequirements; cdecl; external;
procedure dResourceRequirementsDestroy(requirements: dResourceRequirements); cdecl; external;
function dResourceRequirementsClone(requirements: dResourceRequirements): dResourceRequirements; cdecl; external;
procedure dResourceRequirementsMergeIn(summaryRequirements, extraRequirements: dResourceRequirements); cdecl; external;

function dResourceContainerAcquire(requirements: dResourceRequirements): dResourceContainer; cdecl; external;
procedure dResourceContainerDestroy(resources: dResourceContainer); cdecl; external;

procedure dEstimateCooperativelyFactorLDLTResourceRequirements(requirements: dResourceRequirements;
  maximalAllowedThreadCount, maximalRowCount: Cardinal); cdecl; external;

procedure dCooperativelyFactorLDLT(resources: dResourceContainer; allowedThreadCount: Cardinal;
  A, d: PDouble; rowCount, rowSkip: Cardinal); cdecl; external;

procedure dEstimateCooperativelySolveLDLTResourceRequirements(requirements: dResourceRequirements;
  maximalAllowedThreadCount, maximalRowCount: Cardinal); cdecl; external;

procedure dCooperativelySolveLDLT(resources: dResourceContainer; allowedThreadCount: Cardinal;
  const L, d: PDouble; b: PDouble; rowCount, rowSkip: Cardinal); cdecl; external;
procedure dEstimateCooperativelySolveL1StraightResourceRequirements(requirements: dResourceRequirements;
  maximalAllowedThreadCount, maximalRowCount: Cardinal); cdecl; external;

procedure dCooperativelySolveL1Straight(resources: dResourceContainer; allowedThreadCount: Cardinal;
  const L: PDouble; b: PDouble; rowCount, rowSkip: Cardinal); cdecl; external;

procedure dEstimateCooperativelySolveL1TransposedResourceRequirements(requirements: dResourceRequirements;
  maximalAllowedThreadCount, maximalRowCount: Cardinal); cdecl; external;

procedure dCooperativelySolveL1Transposed(resources: dResourceContainer; allowedThreadCount: Cardinal;
  const L: PDouble; b: PDouble; rowCount, rowSkip: Cardinal); cdecl; external;

procedure dEstimateCooperativelyScaleVectorResourceRequirements(requirements: dResourceRequirements;
  maximalAllowedThreadCount, maximalElementCount: Cardinal); cdecl; external;

procedure dCooperativelyScaleVector(resources: dResourceContainer; allowedThreadCount: Cardinal;
  dataVector: PDouble; const scaleVector: PDouble; elementCount: Cardinal); cdecl; external;

type
  dStopwatch = record
    time: Double;
    cc: array[0..1] of Cardinal;
  end;

procedure dStopwatchReset(var sw: dStopwatch); cdecl; external;
procedure dStopwatchStart(var sw: dStopwatch); cdecl; external;
procedure dStopwatchStop(var sw: dStopwatch); cdecl; external;
function dStopwatchTime(var sw: dStopwatch): Double; cdecl; external;

procedure dTimerStart(const description: PChar); cdecl; external;
procedure dTimerNow(const description: PChar); cdecl; external;
procedure dTimerEnd; cdecl; external;
procedure dTimerReport(fout: Pointer; average: Integer); cdecl; external;
function dTimerTicksPerSecond: Double; cdecl; external;
function dTimerResolution: Double; cdecl; external;

procedure dRSetIdentity(var R: dMatrix3); cdecl; external;
procedure dRFromAxisAndAngle(var R: dMatrix3; ax, ay, az, angle: dReal); cdecl; external;
procedure dRFromEulerAngles(var R: dMatrix3; phi, theta, psi: dReal); cdecl; external;
procedure dRFrom2Axes(var R: dMatrix3; ax, ay, az, bx, by, bz: dReal); cdecl; external;
procedure dRFromZAxis(var R: dMatrix3; ax, ay, az: dReal); cdecl; external;

procedure dQSetIdentity(var q: dQuaternion); cdecl; external;
procedure dQFromAxisAndAngle(var q: dQuaternion; ax, ay, az, angle: dReal); cdecl; external;
procedure dQMultiply0(var qa: dQuaternion; const qb, qc: dQuaternion); cdecl; external;
procedure dQMultiply1(var qa: dQuaternion; const qb, qc: dQuaternion); cdecl; external;
procedure dQMultiply2(var qa: dQuaternion; const qb, qc: dQuaternion); cdecl; external;
procedure dQMultiply3(var qa: dQuaternion; const qb, qc: dQuaternion); cdecl; external;
procedure dRfromQ(var R: dMatrix3; const q: dQuaternion); cdecl; external;
procedure dQfromR(var q: dQuaternion; const R: dMatrix3); cdecl; external;
procedure dDQfromW(var dq: array of dReal; const w: dVector3; const q: dQuaternion); cdecl; external;

type
  dMass = record
    mass: dReal;
    c: dVector3;
    I: dMatrix3;
  end;

function dMassCheck(var m: dMass): Integer; cdecl; external;
procedure dMassSetZero(var m: dMass); cdecl; external;
procedure dMassSetParameters(var m: dMass; themass, cgx, cgy, cgz, I11, I22, I33, I12, I13, I23: dReal); cdecl; external;
procedure dMassSetSphere(var m: dMass; density, radius: dReal); cdecl; external;
procedure dMassSetSphereTotal(var m: dMass; total_mass, radius: dReal); cdecl; external;
procedure dMassSetCapsule(var m: dMass; density: dReal; direction: Integer; radius, length: dReal); cdecl; external;
procedure dMassSetCapsuleTotal(var m: dMass; total_mass: dReal; direction: Integer; radius, length: dReal); cdecl; external;
procedure dMassSetCylinder(var m: dMass; density: dReal; direction: Integer; radius, length: dReal); cdecl; external;
procedure dMassSetCylinderTotal(var m: dMass; total_mass: dReal; direction: Integer; radius, length: dReal); cdecl; external;
procedure dMassSetBox(var m: dMass; density, lx, ly, lz: dReal); cdecl; external;
procedure dMassSetBoxTotal(var m: dMass; total_mass, lx, ly, lz: dReal); cdecl; external;
procedure dMassSetTrimesh(var m: dMass; density: dReal; g: dGeom); cdecl; external;
procedure dMassSetTrimeshTotal(var m: dMass; total_mass: dReal; g: dGeom); cdecl; external;
procedure dMassAdjust(var m: dMass; newmass: dReal); cdecl; external;
procedure dMassTranslate(var m: dMass; x, y, z: dReal); cdecl; external;
procedure dMassRotate(var m: dMass; const R: dMatrix3); cdecl; external;
procedure dMassAdd(var a: dMass; const b: dMass); cdecl; external;

procedure dMassSetCappedCylinder(var a: dMass; b: dReal; c: Integer; d, e: dReal); cdecl; external; deprecated;
procedure dMassSetCappedCylinderTotal(var a: dMass; b: dReal; c: Integer; d, e: dReal); cdecl; external; deprecated;
function dTestRand: Integer; cdecl; external;
function dRand: Cardinal; cdecl; external;
function dRandGetSeed: Cardinal; cdecl; external;
procedure dRandSetSeed(s: Cardinal); cdecl; external;
function dRandInt(n: Integer): Integer; cdecl; external;
function dRandReal: dReal; cdecl; external;

procedure dPrintMatrix(const A: PDouble; n, m: Integer; const fmt: PChar; f: Pointer); cdecl; external;
procedure dMakeRandomVector(A: PDouble; n: Integer; range: dReal); cdecl; external;
procedure dMakeRandomMatrix(A: PDouble; n, m: Integer; range: dReal); cdecl; external;
procedure dClearUpperTriangle(A: PDouble; n: Integer); cdecl; external;
function dMaxDifference(const A, B: PDouble; n, m: Integer): dReal; cdecl; external;
function dMaxDifferenceLowerTriangle(const A, B: PDouble; n: Integer): dReal; cdecl; external;

function dWorldCreate: dWorld; cdecl; external;
procedure dWorldDestroy(world: dWorld); cdecl; external;
procedure dWorldSetData(world: dWorld; data: Pointer); cdecl; external;
function dWorldGetData(world: dWorld): Pointer; cdecl; external;

procedure dWorldSetGravity(world: dWorld; x, y, z: dReal); cdecl; external;
procedure dWorldGetGravity(world: dWorld; var gravity: dVector3); cdecl; external;
procedure dWorldSetERP(world: dWorld; erp: dReal); cdecl; external;
function dWorldGetERP(world: dWorld): dReal; cdecl; external;
procedure dWorldSetCFM(world: dWorld; cfm: dReal); cdecl; external;
function dWorldGetCFM(world: dWorld): dReal; cdecl; external;

const
  dWSTP_WorldIslandsIterationMaxThreads = $001;
  dWSTP_IslandSteppingMaxThreads = $002;
  dWSTP_LCPSolvingMaxThreads = $004;

type
  dWorldSteppingThreadingParameters = record
    param_set: Cardinal;
    world_islands_iteration_max_threads: Cardinal;
    island_stepping_max_threads: Cardinal;
    lcp_solving_max_threads: Cardinal;
  end;
  PdWorldSteppingThreadingParameters = ^dWorldSteppingThreadingParameters;

procedure dWorldSetSteppingThreadingParameters(w: dWorld; const ptr_params: PdWorldSteppingThreadingParameters); cdecl; external;
procedure dWorldGetSteppingThreadingParameters(w: dWorld; ptr_params: PdWorldSteppingThreadingParameters); cdecl; external;
procedure dWorldSetStepIslandsProcessingMaxThreadCount(w: dWorld; count: Cardinal); cdecl; external;
function dWorldGetStepIslandsProcessingMaxThreadCount(w: dWorld): Cardinal; cdecl; external;
function dWorldUseSharedWorkingMemory(w, from_world: dWorld): Integer; cdecl; external;
procedure dWorldCleanupWorkingMemory(w: dWorld); cdecl; external;

type
  dWorldStepReserveInfo = record
    struct_size: Cardinal;
    reserve_factor: Single;
    reserve_minimum: Cardinal;
  end;
  PdWorldStepReserveInfo = ^dWorldStepReserveInfo;

function dWorldSetStepMemoryReservationPolicy(w: dWorld; const policyinfo: PdWorldStepReserveInfo): Integer; cdecl; external;

type
  dWorldStepMemoryFunctionsInfo = record
    struct_size: Cardinal;
    alloc_block: function(block_size: dsizeint): Pointer; cdecl;
    shrink_block: function(block_pointer: Pointer; block_current_size, block_smaller_size: dsizeint): Pointer; cdecl;
    free_block: procedure(block_pointer: Pointer; block_current_size: dsizeint); cdecl;
  end;
  PdWorldStepMemoryFunctionsInfo = ^dWorldStepMemoryFunctionsInfo;

function dWorldSetStepMemoryManager(w: dWorld; const memfuncs: PdWorldStepMemoryFunctionsInfo): Integer; cdecl; external;
procedure dWorldSetStepThreadingImplementation(w: dWorld; const functions_info: PdThreadingFunctionsInfo;
  threading_impl: dThreadingImplementation); cdecl; external;

function dWorldStep(w: dWorld; stepsize: dReal): Integer; cdecl; external;
function dWorldQuickStep(w: dWorld; stepsize: dReal): Integer; cdecl; external;

procedure dWorldImpulseToForce(w: dWorld; stepsize, ix, iy, iz: dReal; var force: dVector3); cdecl; external;

procedure dWorldSetQuickStepNumIterations(w: dWorld; num: Integer); cdecl; external;
function dWorldGetQuickStepNumIterations(w: dWorld): Integer; cdecl; external;

procedure dWorldSetQuickStepDynamicIterationParameters(w: dWorld;
  const ptr_iteration_premature_exit_delta, ptr_max_num_extra_factor, ptr_extra_iteration_requirement_delta: PdReal); cdecl; external;

procedure dWorldGetQuickStepDynamicIterationParameters(w: dWorld;
  out_iteration_premature_exit_delta, out_max_num_extra_factor, out_extra_iteration_requirement_delta: PdReal); cdecl; external;

type
  dWorldQuickStepIterationCount_DynamicAdjustmentStatistics = record
    struct_size: Cardinal;
    iteration_count: duint32;
    premature_exits: duint32;
    prolonged_execs: duint32;
    full_extra_execs: duint32;
  end;

function dWorldAttachQuickStepDynamicIterationStatisticsSink(w: dWorld;
  var var_stats: dWorldQuickStepIterationCount_DynamicAdjustmentStatistics): Integer; cdecl; external;

procedure dWorldSetQuickStepW(w: dWorld; over_relaxation: dReal); cdecl; external;
function dWorldGetQuickStepW(w: dWorld): dReal; cdecl; external;

procedure dWorldSetContactMaxCorrectingVel(w: dWorld; vel: dReal); cdecl; external;
function dWorldGetContactMaxCorrectingVel(w: dWorld): dReal; cdecl; external;

procedure dWorldSetContactSurfaceLayer(w: dWorld; depth: dReal); cdecl; external;
function dWorldGetContactSurfaceLayer(w: dWorld): dReal; cdecl; external;

function dWorldGetAutoDisableLinearThreshold(w: dWorld): dReal; cdecl; external;
procedure dWorldSetAutoDisableLinearThreshold(w: dWorld; linear_average_threshold: dReal); cdecl; external;

function dWorldGetAutoDisableAngularThreshold(w: dWorld): dReal; cdecl; external;
procedure dWorldSetAutoDisableAngularThreshold(w: dWorld; angular_average_threshold: dReal); cdecl; external;

function dWorldGetAutoDisableAverageSamplesCount(w: dWorld): Integer; cdecl; external;
procedure dWorldSetAutoDisableAverageSamplesCount(w: dWorld; average_samples_count: Cardinal); cdecl; external;

function dWorldGetAutoDisableSteps(w: dWorld): Integer; cdecl; external;
procedure dWorldSetAutoDisableSteps(w: dWorld; steps: Integer); cdecl; external;
function dWorldGetAutoDisableTime(w: dWorld): dReal; cdecl; external;
procedure dWorldSetAutoDisableTime(w: dWorld; time: dReal); cdecl; external;
function dWorldGetAutoDisableFlag(w: dWorld): Integer; cdecl; external;
procedure dWorldSetAutoDisableFlag(w: dWorld; do_auto_disable: Integer); cdecl; external;

function dWorldGetLinearDampingThreshold(w: dWorld): dReal; cdecl; external;
procedure dWorldSetLinearDampingThreshold(w: dWorld; threshold: dReal); cdecl; external;
function dWorldGetAngularDampingThreshold(w: dWorld): dReal; cdecl; external;
procedure dWorldSetAngularDampingThreshold(w: dWorld; threshold: dReal); cdecl; external;

function dWorldGetLinearDamping(w: dWorld): dReal; cdecl; external;
procedure dWorldSetLinearDamping(w: dWorld; scale: dReal); cdecl; external;
function dWorldGetAngularDamping(w: dWorld): dReal; cdecl; external;
procedure dWorldSetAngularDamping(w: dWorld; scale: dReal); cdecl; external;

procedure dWorldSetDamping(w: dWorld; linear_scale, angular_scale: dReal); cdecl; external;
function dWorldGetMaxAngularSpeed(w: dWorld): dReal; cdecl; external;
procedure dWorldSetMaxAngularSpeed(w: dWorld; max_speed: dReal); cdecl; external;

function dBodyGetAutoDisableLinearThreshold(body: dBody): dReal; cdecl; external;
procedure dBodySetAutoDisableLinearThreshold(body: dBody; linear_average_threshold: dReal); cdecl; external;
function dBodyGetAutoDisableAngularThreshold(body: dBody): dReal; cdecl; external;
procedure dBodySetAutoDisableAngularThreshold(body: dBody; angular_average_threshold: dReal); cdecl; external;
function dBodyGetAutoDisableAverageSamplesCount(body: dBody): Integer; cdecl; external;
procedure dBodySetAutoDisableAverageSamplesCount(body: dBody; average_samples_count: Cardinal); cdecl; external;
function dBodyGetAutoDisableSteps(body: dBody): Integer; cdecl; external;
procedure dBodySetAutoDisableSteps(body: dBody; steps: Integer); cdecl; external;
function dBodyGetAutoDisableTime(body: dBody): dReal; cdecl; external;
procedure dBodySetAutoDisableTime(body: dBody; time: dReal); cdecl; external;
function dBodyGetAutoDisableFlag(body: dBody): Integer; cdecl; external;
procedure dBodySetAutoDisableFlag(body: dBody; do_auto_disable: Integer); cdecl; external;
procedure dBodySetAutoDisableDefaults(body: dBody); cdecl; external;

function dBodyGetWorld(body: dBody): dWorld; cdecl; external;
function dBodyCreate(world: dWorld): dBody; cdecl; external;
procedure dBodyDestroy(body: dBody); cdecl; external;
procedure dBodySetData(body: dBody; data: Pointer); cdecl; external;
function dBodyGetData(body: dBody): Pointer; cdecl; external;

procedure dBodySetPosition(body: dBody; x, y, z: dReal); cdecl; external;
procedure dBodySetRotation(body: dBody; const R: dMatrix3); cdecl; external;
procedure dBodySetQuaternion(body: dBody; const q: dQuaternion); cdecl; external;
procedure dBodySetLinearVel(body: dBody; x, y, z: dReal); cdecl; external;
procedure dBodySetAngularVel(body: dBody; x, y, z: dReal); cdecl; external;

function dBodyGetPosition(body: dBody): PdReal; cdecl; external;
procedure dBodyCopyPosition(body: dBody; var pos: dVector3); cdecl; external;
function dBodyGetRotation(body: dBody): PdReal; cdecl; external;
procedure dBodyCopyRotation(body: dBody; var R: dMatrix3); cdecl; external;
function dBodyGetQuaternion(body: dBody): PdReal; cdecl; external;
procedure dBodyCopyQuaternion(body: dBody; var quat: dQuaternion); cdecl; external;
function dBodyGetLinearVel(body: dBody): PdReal; cdecl; external;
function dBodyGetAngularVel(body: dBody): PdReal; cdecl; external;

procedure dBodySetMass(body: dBody; var mass: dMass); cdecl; external;
procedure dBodyGetMass(body: dBody; var mass: dMass); cdecl; external;

procedure dBodyAddForce(body: dBody; fx, fy, fz: dReal); cdecl; external;
procedure dBodyAddTorque(body: dBody; fx, fy, fz: dReal); cdecl; external;
procedure dBodyAddRelForce(body: dBody; fx, fy, fz: dReal); cdecl; external;
procedure dBodyAddRelTorque(body: dBody; fx, fy, fz: dReal); cdecl; external;
procedure dBodyAddForceAtPos(body: dBody; fx, fy, fz, px, py, pz: dReal); cdecl; external;
procedure dBodyAddForceAtRelPos(body: dBody; fx, fy, fz, px, py, pz: dReal); cdecl; external;
procedure dBodyAddRelForceAtPos(body: dBody; fx, fy, fz, px, py, pz: dReal); cdecl; external;
procedure dBodyAddRelForceAtRelPos(body: dBody; fx, fy, fz, px, py, pz: dReal); cdecl; external;

function dBodyGetForce(body: dBody): PdReal; cdecl; external;
function dBodyGetTorque(body: dBody): PdReal; cdecl; external;
procedure dBodySetForce(body: dBody; x, y, z: dReal); cdecl; external;
procedure dBodySetTorque(body: dBody; x, y, z: dReal); cdecl; external;

procedure dBodyGetRelPointPos(body: dBody; px, py, pz: dReal; var result: dVector3); cdecl; external;
procedure dBodyGetRelPointVel(body: dBody; px, py, pz: dReal; var result: dVector3); cdecl; external;
procedure dBodyGetPointVel(body: dBody; px, py, pz: dReal; var result: dVector3); cdecl; external;
procedure dBodyGetPosRelPoint(body: dBody; px, py, pz: dReal; var result: dVector3); cdecl; external;
procedure dBodyVectorToWorld(body: dBody; px, py, pz: dReal; var result: dVector3); cdecl; external;
procedure dBodyVectorFromWorld(body: dBody; px, py, pz: dReal; var result: dVector3); cdecl; external;
procedure dBodySetFiniteRotationMode(body: dBody; mode: Integer); cdecl; external;
procedure dBodySetFiniteRotationAxis(body: dBody; x, y, z: dReal); cdecl; external;
function dBodyGetFiniteRotationMode(body: dBody): Integer; cdecl; external;
procedure dBodyGetFiniteRotationAxis(body: dBody; var result: dVector3); cdecl; external;

function dBodyGetNumJoints(b: dBody): Integer; cdecl; external;
function dBodyGetJoint(body: dBody; index: Integer): dJoint; cdecl; external;
procedure dBodySetDynamic(body: dBody); cdecl; external;
procedure dBodySetKinematic(body: dBody); cdecl; external;
function dBodyIsKinematic(body: dBody): Integer; cdecl; external;

procedure dBodyEnable(body: dBody); cdecl; external;
procedure dBodyDisable(body: dBody); cdecl; external;
function dBodyIsEnabled(body: dBody): Integer; cdecl; external;

procedure dBodySetGravityMode(b: dBody; mode: Integer); cdecl; external;
function dBodyGetGravityMode(b: dBody): Integer; cdecl; external;

type pBodyCallback = procedure(b: dBody); cdecl;

procedure dBodySetMovedCallback(b: dBody; callback: pBodyCallback); cdecl; external;
function dBodyGetFirstGeom(b: dBody): dGeom; cdecl; external;
function dBodyGetNextGeom(g: dGeom): dGeom; cdecl; external;
procedure dBodySetDampingDefaults(b: dBody); cdecl; external;

function dBodyGetLinearDamping(b: dBody): dReal; cdecl; external;
procedure dBodySetLinearDamping(b: dBody; scale: dReal); cdecl; external;
function dBodyGetAngularDamping(b: dBody): dReal; cdecl; external;
procedure dBodySetAngularDamping(b: dBody; scale: dReal); cdecl; external;
procedure dBodySetDamping(b: dBody; linear_scale, angular_scale: dReal); cdecl; external;

function dBodyGetLinearDampingThreshold(b: dBody): dReal; cdecl; external;
procedure dBodySetLinearDampingThreshold(b: dBody; threshold: dReal); cdecl; external;
function dBodyGetAngularDampingThreshold(b: dBody): dReal; cdecl; external;
procedure dBodySetAngularDampingThreshold(b: dBody; threshold: dReal); cdecl; external;
function dBodyGetMaxAngularSpeed(b: dBody): dReal; cdecl; external;
procedure dBodySetMaxAngularSpeed(b: dBody; max_speed: dReal); cdecl; external;

function dBodyGetGyroscopicMode(b: dBody): Integer; cdecl; external;
procedure dBodySetGyroscopicMode(b: dBody; enabled: Integer); cdecl; external;

function dJointCreateBall(world: dWorld; group: dJointGroup): dJoint; cdecl; external;
function dJointCreateHinge(world: dWorld; group: dJointGroup): dJoint; cdecl; external;
function dJointCreateSlider(world: dWorld; group: dJointGroup): dJoint; cdecl; external;
function dJointCreateContact(world: dWorld; group: dJointGroup; var contact: dContact): dJoint; cdecl; external;
function dJointCreateHinge2(world: dWorld; group: dJointGroup): dJoint; cdecl; external;
function dJointCreateUniversal(world: dWorld; group: dJointGroup): dJoint; cdecl; external;
function dJointCreatePR(world: dWorld; group: dJointGroup): dJoint; cdecl; external;
function dJointCreatePU(world: dWorld; group: dJointGroup): dJoint; cdecl; external;
function dJointCreatePiston(world: dWorld; group: dJointGroup): dJoint; cdecl; external;
function dJointCreateFixed(world: dWorld; group: dJointGroup): dJoint; cdecl; external;
function dJointCreateNull(world: dWorld; group: dJointGroup): dJoint; cdecl; external;
function dJointCreateAMotor(world: dWorld; group: dJointGroup): dJoint; cdecl; external;
function dJointCreateLMotor(world: dWorld; group: dJointGroup): dJoint; cdecl; external;
function dJointCreatePlane2D(world: dWorld; group: dJointGroup): dJoint; cdecl; external;
function dJointCreateDBall(world: dWorld; group: dJointGroup): dJoint; cdecl; external;
function dJointCreateDHinge(world: dWorld; group: dJointGroup): dJoint; cdecl; external;
function dJointCreateTransmission(world: dWorld; group: dJointGroup): dJoint; cdecl; external;

procedure dJointDestroy(joint: dJoint); cdecl; external;
function dJointGroupCreate(max_size: Integer): dJointGroup; cdecl; external;
procedure dJointGroupDestroy(group: dJointGroup); cdecl; external;
procedure dJointGroupEmpty(group: dJointGroup); cdecl; external;
function dJointGetNumBodies(joint: dJoint): Integer; cdecl; external;
procedure dJointAttach(joint: dJoint; body1, body2: dBody); cdecl; external;
procedure dJointEnable(joint: dJoint); cdecl; external;
procedure dJointDisable(joint: dJoint); cdecl; external;
function dJointIsEnabled(joint: dJoint): Integer; cdecl; external;

procedure dJointSetData(joint: dJoint; data: Pointer); cdecl; external;
function dJointGetData(joint: dJoint): Pointer; cdecl; external;
function dJointGetType(joint: dJoint): dJointType; cdecl; external;
function dJointGetBody(joint: dJoint; index: Integer): dBody; cdecl; external;
procedure dJointSetFeedback(joint: dJoint; feedback: PdJointFeedback); cdecl; external;
function dJointGetFeedback(joint: dJoint): PdJointFeedback; cdecl; external;

procedure dJointSetBallAnchor(joint: dJoint; x, y, z: dReal); cdecl; external;
procedure dJointSetBallAnchor2(joint: dJoint; x, y, z: dReal); cdecl; external;
procedure dJointSetBallParam(joint: dJoint; parameter: Integer; value: dReal); cdecl; external;

procedure dJointSetHingeAnchor(joint: dJoint; x, y, z: dReal); cdecl; external;
procedure dJointSetHingeAnchorDelta(joint: dJoint; x, y, z, ax, ay, az: dReal); cdecl; external;
procedure dJointSetHingeAxis(joint: dJoint; x, y, z: dReal); cdecl; external;
procedure dJointSetHingeAxisOffset(j: dJoint; x, y, z, angle: dReal); cdecl; external;
procedure dJointSetHingeParam(joint: dJoint; parameter: Integer; value: dReal); cdecl; external;
procedure dJointAddHingeTorque(joint: dJoint; torque: dReal); cdecl; external;

procedure dJointSetSliderAxis(joint: dJoint; x, y, z: dReal); cdecl; external;
procedure dJointSetSliderAxisDelta(joint: dJoint; x, y, z, ax, ay, az: dReal); cdecl; external;
procedure dJointSetSliderParam(joint: dJoint; parameter: Integer; value: dReal); cdecl; external;
procedure dJointAddSliderForce(joint: dJoint; force: dReal); cdecl; external;

procedure dJointSetHinge2Anchor(joint: dJoint; x, y, z: dReal); cdecl; external;
procedure dJointSetHinge2Axes(j: dJoint; const axis1, axis2: PdReal); cdecl; external;
procedure dJointSetHinge2Axis1(j: dJoint; x, y, z: dReal); cdecl; external; deprecated;
procedure dJointSetHinge2Axis2(j: dJoint; x, y, z: dReal); cdecl; external; deprecated;
procedure dJointSetHinge2Param(joint: dJoint; parameter: Integer; value: dReal); cdecl; external;
procedure dJointAddHinge2Torques(joint: dJoint; torque1, torque2: dReal); cdecl; external;
procedure dJointSetPRParam(joint: dJoint; parameter: Integer; value: dReal); cdecl; external;
procedure dJointAddPRTorque(j: dJoint; torque: dReal); cdecl; external;

procedure dJointSetPUAnchor(joint: dJoint; x, y, z: dReal); cdecl; external;
procedure dJointSetPUAnchorOffset(joint: dJoint; x, y, z, dx, dy, dz: dReal); cdecl; external;
procedure dJointSetPUAxis1(joint: dJoint; x, y, z: dReal); cdecl; external;
procedure dJointSetPUAxis2(joint: dJoint; x, y, z: dReal); cdecl; external;
procedure dJointSetPUAxis3(joint: dJoint; x, y, z: dReal); cdecl; external;
procedure dJointSetPUAxisP(id: dJoint; x, y, z: dReal); cdecl; external;
procedure dJointSetPUParam(joint: dJoint; parameter: Integer; value: dReal); cdecl; external;
procedure dJointAddPUTorques(joint: dJoint; torque1, torque2: dReal); cdecl; external;

procedure dJointSetPistonAnchor(joint: dJoint; x, y, z: dReal); cdecl; external;
procedure dJointSetPistonAnchorOffset(j: dJoint; x, y, z, dx, dy, dz: dReal); cdecl; external;
procedure dJointSetPistonAxis(joint: dJoint; x, y, z: dReal); cdecl; external;
procedure dJointSetPistonParam(joint: dJoint; parameter: Integer; value: dReal); cdecl; external;
procedure dJointAddPistonForce(joint: dJoint; force: dReal); cdecl; external;

procedure dJointSetFixed(joint: dJoint); cdecl; external;
procedure dJointSetFixedParam(joint: dJoint; parameter: Integer; value: dReal); cdecl; external;

procedure dJointSetAMotorNumAxes(joint: dJoint; num: Integer); cdecl; external;
procedure dJointSetAMotorAxis(joint: dJoint; anum, rel: Integer; x, y, z: dReal); cdecl; external;
procedure dJointSetAMotorAngle(joint: dJoint; anum: Integer; angle: dReal); cdecl; external;
procedure dJointSetAMotorParam(joint: dJoint; parameter: Integer; value: dReal); cdecl; external;
procedure dJointSetAMotorMode(joint: dJoint; mode: Integer); cdecl; external;
procedure dJointAddAMotorTorques(joint: dJoint; torque1, torque2, torque3: dReal); cdecl; external;

procedure dJointSetLMotorNumAxes(joint: dJoint; num: Integer); cdecl; external;
procedure dJointSetLMotorAxis(joint: dJoint; anum, rel: Integer; x, y, z: dReal); cdecl; external;
procedure dJointSetLMotorParam(joint: dJoint; parameter: Integer; value: dReal); cdecl; external;

procedure dJointSetPlane2DXParam(joint: dJoint; parameter: Integer; value: dReal); cdecl; external;
procedure dJointSetPlane2DYParam(joint: dJoint; parameter: Integer; value: dReal); cdecl; external;
procedure dJointSetPlane2DAngleParam(joint: dJoint; parameter: Integer; value: dReal); cdecl; external;

procedure dJointGetBallAnchor(joint: dJoint; var result: dVector3); cdecl; external;
procedure dJointGetBallAnchor2(joint: dJoint; var result: dVector3); cdecl; external;
function dJointGetBallParam(joint: dJoint; parameter: Integer): dReal; cdecl; external;

procedure dJointGetHingeAnchor(joint: dJoint; var result: dVector3); cdecl; external;
procedure dJointGetHingeAnchor2(joint: dJoint; var result: dVector3); cdecl; external;
procedure dJointGetHingeAxis(joint: dJoint; var result: dVector3); cdecl; external;
function dJointGetHingeParam(joint: dJoint; parameter: Integer): dReal; cdecl; external;
function dJointGetHingeAngle(joint: dJoint): dReal; cdecl; external;
function dJointGetHingeAngleRate(joint: dJoint): dReal; cdecl; external;

function dJointGetSliderPosition(joint: dJoint): dReal; cdecl; external;
function dJointGetSliderPositionRate(joint: dJoint): dReal; cdecl; external;
procedure dJointGetSliderAxis(joint: dJoint; var result: dVector3); cdecl; external;
function dJointGetSliderParam(joint: dJoint; parameter: Integer): dReal; cdecl; external;

procedure dJointGetHinge2Anchor(joint: dJoint; var result: dVector3); cdecl; external;
procedure dJointGetHinge2Anchor2(joint: dJoint; var result: dVector3); cdecl; external;
procedure dJointGetHinge2Axis1(joint: dJoint; var result: dVector3); cdecl; external;
procedure dJointGetHinge2Axis2(joint: dJoint; var result: dVector3); cdecl; external;
function dJointGetHinge2Param(joint: dJoint; parameter: Integer): dReal; cdecl; external;
function dJointGetHinge2Angle1(joint: dJoint): dReal; cdecl; external;
function dJointGetHinge2Angle2(joint: dJoint): dReal; cdecl; external;
function dJointGetHinge2Angle1Rate(joint: dJoint): dReal; cdecl; external;
function dJointGetHinge2Angle2Rate(joint: dJoint): dReal; cdecl; external;

procedure dJointGetUniversalAnchor(joint: dJoint; var result: dVector3); cdecl; external;
procedure dJointGetUniversalAnchor2(joint: dJoint; var result: dVector3); cdecl; external;
procedure dJointGetUniversalAxis1(joint: dJoint; var result: dVector3); cdecl; external;
procedure dJointGetUniversalAxis2(joint: dJoint; var result: dVector3); cdecl; external;
function dJointGetUniversalParam(joint: dJoint; parameter: Integer): dReal; cdecl; external;
procedure dJointGetUniversalAngles(joint: dJoint; var angle1, angle2: dReal); cdecl; external;
function dJointGetUniversalAngle1(joint: dJoint): dReal; cdecl; external;
function dJointGetUniversalAngle2(joint: dJoint): dReal; cdecl; external;
function dJointGetUniversalAngle1Rate(joint: dJoint): dReal; cdecl; external;
function dJointGetUniversalAngle2Rate(joint: dJoint): dReal; cdecl; external;

procedure dJointGetPRAnchor(joint: dJoint; var result: dVector3); cdecl; external;
function dJointGetPRPosition(joint: dJoint): dReal; cdecl; external;
function dJointGetPRPositionRate(joint: dJoint): dReal; cdecl; external;
function dJointGetPRAngle(joint: dJoint): dReal; cdecl; external;
function dJointGetPRAngleRate(joint: dJoint): dReal; cdecl; external;
procedure dJointGetPRAxis1(joint: dJoint; var result: dVector3); cdecl; external;
procedure dJointGetPRAxis2(joint: dJoint; var result: dVector3); cdecl; external;
function dJointGetPRParam(joint: dJoint; parameter: Integer): dReal; cdecl; external;

procedure dJointGetPUAnchor(joint: dJoint; var result: dVector3); cdecl; external;
function dJointGetPUPosition(joint: dJoint): dReal; cdecl; external;
function dJointGetPUPositionRate(joint: dJoint): dReal; cdecl; external;
procedure dJointGetPUAxis1(joint: dJoint; var result: dVector3); cdecl; external;
procedure dJointGetPUAxis2(joint: dJoint; var result: dVector3); cdecl; external;
procedure dJointGetPUAxis3(joint: dJoint; var result: dVector3); cdecl; external;
procedure dJointGetPUAxisP(id: dJoint; var result: dVector3); cdecl; external;
function dJointGetAMotorNumAxes(joint: dJoint): Integer; cdecl; external;
procedure dJointGetAMotorAxis(joint: dJoint; anum: Integer; var result: dVector3); cdecl; external;
function dJointGetAMotorAxisRel(joint: dJoint; anum: Integer): Integer; cdecl; external;
function dJointGetAMotorAngle(joint: dJoint; anum: Integer): dReal; cdecl; external;
function dJointGetAMotorAngleRate(joint: dJoint; anum: Integer): dReal; cdecl; external;
function dJointGetAMotorParam(joint: dJoint; parameter: Integer): dReal; cdecl; external;
function dJointGetAMotorMode(joint: dJoint): Integer; cdecl; external;

function dJointGetLMotorNumAxes(joint: dJoint): Integer; cdecl; external;
procedure dJointGetLMotorAxis(joint: dJoint; anum: Integer; var result: dVector3); cdecl; external;
function dJointGetLMotorParam(joint: dJoint; parameter: Integer): dReal; cdecl; external;
function dJointGetFixedParam(joint: dJoint; parameter: Integer): dReal; cdecl; external;

procedure dJointGetTransmissionContactPoint1(joint: dJoint; var result: dVector3); cdecl; external;
procedure dJointGetTransmissionContactPoint2(joint: dJoint; var result: dVector3); cdecl; external;
procedure dJointSetTransmissionAxis1(joint: dJoint; x, y, z: dReal); cdecl; external;
procedure dJointGetTransmissionAxis1(joint: dJoint; var result: dVector3); cdecl; external;
procedure dJointSetTransmissionAxis2(joint: dJoint; x, y, z: dReal); cdecl; external;
procedure dJointGetTransmissionAxis2(joint: dJoint; var result: dVector3); cdecl; external;
procedure dJointSetTransmissionAnchor1(joint: dJoint; x, y, z: dReal); cdecl; external;
procedure dJointGetTransmissionAnchor1(joint: dJoint; var result: dVector3); cdecl; external;
procedure dJointSetTransmissionAnchor2(joint: dJoint; x, y, z: dReal); cdecl; external;
procedure dJointGetTransmissionAnchor2(joint: dJoint; var result: dVector3); cdecl; external;
procedure dJointSetTransmissionParam(joint: dJoint; parameter: Integer; value: dReal); cdecl; external;
function dJointGetTransmissionParam(joint: dJoint; parameter: Integer): dReal; cdecl; external;

procedure dJointSetTransmissionMode(joint: dJoint; mode: Integer); cdecl; external;
function dJointGetTransmissionMode(joint: dJoint): Integer; cdecl; external;
procedure dJointSetTransmissionRatio(joint: dJoint; ratio: dReal); cdecl; external;
function dJointGetTransmissionRatio(joint: dJoint): dReal; cdecl; external;
procedure dJointSetTransmissionAxis(joint: dJoint; x, y, z: dReal); cdecl; external;
procedure dJointGetTransmissionAxis(joint: dJoint; var result: dVector3); cdecl; external;
function dJointGetTransmissionAngle1(joint: dJoint): dReal; cdecl; external;
function dJointGetTransmissionAngle2(joint: dJoint): dReal; cdecl; external;
function dJointGetTransmissionRadius1(joint: dJoint): dReal; cdecl; external;
function dJointGetTransmissionRadius2(joint: dJoint): dReal; cdecl; external;
procedure dJointSetTransmissionRadius1(joint: dJoint; radius: dReal); cdecl; external;
procedure dJointSetTransmissionRadius2(joint: dJoint; radius: dReal); cdecl; external;
function dJointGetTransmissionBacklash(joint: dJoint): dReal; cdecl; external;
procedure dJointSetTransmissionBacklash(joint: dJoint; backlash: dReal); cdecl; external;

procedure dJointSetDBallAnchor1(joint: dJoint; x, y, z: dReal); cdecl; external;
procedure dJointSetDBallAnchor2(joint: dJoint; x, y, z: dReal); cdecl; external;
procedure dJointGetDBallAnchor1(joint: dJoint; var result: dVector3); cdecl; external;
procedure dJointGetDBallAnchor2(joint: dJoint; var result: dVector3); cdecl; external;
function dJointGetDBallDistance(joint: dJoint): dReal; cdecl; external;
procedure dJointSetDBallDistance(joint: dJoint; dist: dReal); cdecl; external;
procedure dJointSetDBallParam(joint: dJoint; parameter: Integer; value: dReal); cdecl; external;
function dJointGetDBallParam(joint: dJoint; parameter: Integer): dReal; cdecl; external;

procedure dJointSetDHingeAxis(joint: dJoint; x, y, z: dReal); cdecl; external;
procedure dJointGetDHingeAxis(joint: dJoint; var result: dVector3); cdecl; external;
procedure dJointSetDHingeAnchor1(joint: dJoint; x, y, z: dReal); cdecl; external;
procedure dJointSetDHingeAnchor2(joint: dJoint; x, y, z: dReal); cdecl; external;
procedure dJointGetDHingeAnchor1(joint: dJoint; var result: dVector3); cdecl; external;
procedure dJointGetDHingeAnchor2(joint: dJoint; var result: dVector3); cdecl; external;
function dJointGetDHingeDistance(joint: dJoint): dReal; cdecl; external;
procedure dJointSetDHingeParam(joint: dJoint; parameter: Integer; value: dReal); cdecl; external;
function dJointGetDHingeParam(joint: dJoint; parameter: Integer): dReal; cdecl; external;

function dConnectingJoint(body1, body2: dBody): dJoint; cdecl; external;
function dConnectingJointList(body1, body2: dBody; var jointList: dJoint): Integer; cdecl; external;
function dAreConnected(body1, body2: dBody): Integer; cdecl; external;
function dAreConnectedExcluding(body1, body2: dBody; joint_type: Integer): Integer; cdecl; external;

type
  dNearCallback = procedure(data: Pointer; o1, o2: dGeom); cdecl;

function dSimpleSpaceCreate(space: dSpace): dSpace; cdecl; external;
function dHashSpaceCreate(space: dSpace): dSpace; cdecl; external;
function dQuadTreeSpaceCreate(space: dSpace; const Center, Extents: dVector3; Depth: Integer): dSpace; cdecl; external;
function dSweepAndPruneSpaceCreate(space: dSpace; axisorder: Integer): dSpace; cdecl; external;
procedure dSpaceDestroy(space: dSpace); cdecl; external;
procedure dHashSpaceSetLevels(space: dSpace; minlevel, maxlevel: Integer); cdecl; external;
procedure dHashSpaceGetLevels(space: dSpace; var minlevel, maxlevel: Integer); cdecl; external;
procedure dSpaceSetCleanup(space: dSpace; mode: Integer); cdecl; external;
function dSpaceGetCleanup(space: dSpace): Integer; cdecl; external;
procedure dSpaceSetSublevel(space: dSpace; sublevel: Integer); cdecl; external;
function dSpaceGetSublevel(space: dSpace): Integer; cdecl; external;
procedure dSpaceSetManualCleanup(space: dSpace; mode: Integer); cdecl; external;
function dSpaceGetManualCleanup(space: dSpace): Integer; cdecl; external;
procedure dSpaceAdd(space: dSpace; geom: dGeom); cdecl; external;
procedure dSpaceRemove(space: dSpace; geom: dGeom); cdecl; external;
function dSpaceQuery(space: dSpace; geom: dGeom): Integer; cdecl; external;
procedure dSpaceClean(space: dSpace); cdecl; external;
function dSpaceGetNumGeoms(space: dSpace): Integer; cdecl; external;
function dSpaceGetGeom(space: dSpace; i: Integer): dGeom; cdecl; external;
function dSpaceGetClass(space: dSpace): Integer; cdecl; external;

procedure dGeomDestroy(geom: dGeom); cdecl; external;
procedure dGeomSetData(geom: dGeom; data: Pointer); cdecl; external;
function dGeomGetData(geom: dGeom): Pointer; cdecl; external;
const
  dGeomCommonControlClass = 0;
  dGeomColliderControlClass = 1;

  dGeomCommonAnyControlCode = 0;
  dGeomColliderSetMergeSphereContactsControlCode = 1;
  dGeomColliderGetMergeSphereContactsControlCode = 2;

  dGeomColliderMergeContactsValue__Default = 0;
  dGeomColliderMergeContactsValue_None = 1;
  dGeomColliderMergeContactsValue_Normals = 2;
  dGeomColliderMergeContactsValue_Full = 3;

function dGeomLowLevelControl(geom: dGeom; controlClass, controlCode: Integer; dataValue: Pointer; dataSize: PInteger): Integer; cdecl; external;
procedure dGeomGetRelPointPos(geom: dGeom; px, py, pz: dReal; var result: dVector3); cdecl; external;
procedure dGeomGetPosRelPoint(geom: dGeom; px, py, pz: dReal; var result: dVector3); cdecl; external;
procedure dGeomVectorToWorld(geom: dGeom; px, py, pz: dReal; var result: dVector3); cdecl; external;
procedure dGeomVectorFromWorld(geom: dGeom; px, py, pz: dReal; var result: dVector3); cdecl; external;

procedure dGeomSetOffsetPosition(geom: dGeom; x, y, z: dReal); cdecl; external;
procedure dGeomSetOffsetRotation(geom: dGeom; const R: dMatrix3); cdecl; external;
procedure dGeomSetOffsetQuaternion(geom: dGeom; const Q: dQuaternion); cdecl; external;
procedure dGeomSetOffsetWorldPosition(geom: dGeom; x, y, z: dReal); cdecl; external;
procedure dGeomSetOffsetWorldRotation(geom: dGeom; const R: dMatrix3); cdecl; external;
procedure dGeomSetOffsetWorldQuaternion(geom: dGeom; const Q: dQuaternion); cdecl; external;
procedure dGeomClearOffset(geom: dGeom); cdecl; external;
function dGeomIsOffset(geom: dGeom): Integer; cdecl; external;
function dGeomGetOffsetPosition(geom: dGeom): PdReal; cdecl; external;
procedure dGeomCopyOffsetPosition(geom: dGeom; var pos: dVector3); cdecl; external;
function dGeomGetOffsetRotation(geom: dGeom): PdReal; cdecl; external;
procedure dGeomCopyOffsetRotation(geom: dGeom; var R: dMatrix3); cdecl; external;
procedure dGeomGetOffsetQuaternion(geom: dGeom; var result: dQuaternion); cdecl; external;

function dCollide(o1, o2: dGeom; flags: Integer; var contact: dContactGeom; skip: Integer): Integer; cdecl; external;
procedure dSpaceCollide(space: dSpace; data: Pointer; callback: dNearCallback); cdecl; external;
procedure dSpaceCollide2(space1, space2: dGeom; data: Pointer; callback: dNearCallback); cdecl; external;

const
  dMaxUserClasses = 4;
  dSphereClass = 0;
  dBoxClass = 1;
  dCapsuleClass = 2;
  dCylinderClass = 3;
  dPlaneClass = 4;
  dRayClass = 5;
  dConvexClass = 6;
  dGeomTransformClass = 7;
  dTriMeshClass = 8;
  dHeightfieldClass = 9;
  dFirstSpaceClass = 10;
  dSimpleSpaceClass = dFirstSpaceClass;
  dHashSpaceClass = 11;
  dSweepAndPruneSpaceClass = 12;
  dQuadTreeSpaceClass = 13;
  dLastSpaceClass = dQuadTreeSpaceClass;
  dFirstUserClass = 14;
  dLastUserClass = dFirstUserClass + dMaxUserClasses - 1;
  dGeomNumClasses = 18;

function dCreateSphere(space: dSpace; radius: dReal): dGeom; cdecl; external;
procedure dGeomSphereSetRadius(sphere: dGeom; radius: dReal); cdecl; external;
function dGeomSphereGetRadius(sphere: dGeom): dReal; cdecl; external;
function dGeomSpherePointDepth(sphere: dGeom; x, y, z: dReal): dReal; cdecl; external;

function dCreateConvex(space: dSpace; const _planes: PdReal; _planecount: Cardinal; const _points: PdReal; _pointcount: Cardinal; const _polygons: PCardinal): dGeom; cdecl; external;
procedure dGeomSetConvex(g: dGeom; const _planes: PdReal; _count: Cardinal; const _points: PdReal; _pointcount: Cardinal; const _polygons: PCardinal); cdecl; external;
function dCreateBox(space: dSpace; lx, ly, lz: dReal): dGeom; cdecl; external;
procedure dGeomBoxSetLengths(box: dGeom; lx, ly, lz: dReal); cdecl; external;
procedure dGeomBoxGetLengths(box: dGeom; var result: dVector3); cdecl; external;
function dGeomBoxPointDepth(box: dGeom; x, y, z: dReal): dReal; cdecl; external;

function dCreatePlane(space: dSpace; a, b, c, d: dReal): dGeom; cdecl; external;
procedure dGeomPlaneSetParams(plane: dGeom; a, b, c, d: dReal); cdecl; external;
procedure dGeomPlaneGetParams(plane: dGeom; var result: dVector4); cdecl; external;
function dGeomPlanePointDepth(plane: dGeom; x, y, z: dReal): dReal; cdecl; external;

function dCreateCapsule(space: dSpace; radius, length: dReal): dGeom; cdecl; external;
procedure dGeomCapsuleSetParams(ccylinder: dGeom; radius, length: dReal); cdecl; external;
procedure dGeomCapsuleGetParams(ccylinder: dGeom; radius, length: PdReal); cdecl; external;
function dGeomCapsulePointDepth(ccylinder: dGeom; x, y, z: dReal): dReal; cdecl; external;

function dCreateCylinder(space: dSpace; radius, length: dReal): dGeom; cdecl; external;
procedure dGeomCylinderSetParams(cylinder: dGeom; radius, length: dReal); cdecl; external;
procedure dGeomCylinderGetParams(cylinder: dGeom; radius, length: PdReal); cdecl; external;

function dCreateRay(space: dSpace; length: dReal): dGeom; cdecl; external;
procedure dGeomRaySetLength(ray: dGeom; length: dReal); cdecl; external;
function dGeomRayGetLength(ray: dGeom): dReal; cdecl; external;
procedure dGeomRaySet(ray: dGeom; px, py, pz, dx, dy, dz: dReal); cdecl; external;
procedure dGeomRayGet(ray: dGeom; var start, dir: dVector3); cdecl; external;

procedure dGeomRaySetFirstContact(g: dGeom; firstContact: Integer); cdecl; external;
function dGeomRayGetFirstContact(g: dGeom): Integer; cdecl; external;
procedure dGeomRaySetBackfaceCull(g: dGeom; backfaceCull: Integer); cdecl; external;
function dGeomRayGetBackfaceCull(g: dGeom): Integer; cdecl; external;
procedure dGeomRaySetClosestHit(g: dGeom; closestHit: Integer); cdecl; external;
function dGeomRayGetClosestHit(g: dGeom): Integer; cdecl; external;

type
  dxTriMeshData = record end;
  dTriMeshData = ^dxTriMeshData;

  dMeshTriangleVertex = (
    dMTV_FIRST,
    dMTV_SECOND,
    dMTV_THIRD
  );

function dGeomTriMeshDataCreate: dTriMeshData; cdecl; external;
procedure dGeomTriMeshDataDestroy(g: dTriMeshData); cdecl; external;

const
  dTRIMESHDATA__MIN = 0;
  dTRIMESHDATA_FACE_NORMALS = dTRIMESHDATA__MIN;
  dTRIMESHDATA_USE_FLAGS = 1;
  dTRIMESHDATA__MAX = 2;
  TRIMESH_FACE_NORMALS = dTRIMESHDATA_FACE_NORMALS;

  dMESHDATAUSE_EDGE1 = $01;
  dMESHDATAUSE_EDGE2 = $02;
  dMESHDATAUSE_EDGE3 = $04;
  dMESHDATAUSE_VERTEX1 = $08;
  dMESHDATAUSE_VERTEX2 = $10;
  dMESHDATAUSE_VERTEX3 = $20;

procedure dGeomTriMeshDataSet(g: dTriMeshData; data_id: Integer; in_data: Pointer); cdecl; external;
function dGeomTriMeshDataGet(g: dTriMeshData; data_id: Integer): Pointer; cdecl; external;
function dGeomTriMeshDataGet2(g: dTriMeshData; data_id: Integer; out out_size: dsizeint): Pointer; cdecl; external;

procedure dGeomTriMeshSetLastTransform(g: dGeom; const last_trans: dMatrix4); cdecl; external;
function dGeomTriMeshGetLastTransform(g: dGeom): PdReal; cdecl; external;

procedure dGeomTriMeshDataBuildSingle(g: dTriMeshData; const Vertices: Pointer; VertexStride, VertexCount: Integer; const Indices: Pointer; IndexCount, TriStride: Integer); cdecl; external;
procedure dGeomTriMeshDataBuildSingle1(g: dTriMeshData; const Vertices: Pointer; VertexStride, VertexCount: Integer; const Indices: Pointer; IndexCount, TriStride: Integer; const Normals: Pointer); cdecl; external;
procedure dGeomTriMeshDataBuildDouble(g: dTriMeshData; const Vertices: Pointer; VertexStride, VertexCount: Integer; const Indices: Pointer; IndexCount, TriStride: Integer); cdecl; external;
procedure dGeomTriMeshDataBuildDouble1(g: dTriMeshData; const Vertices: Pointer; VertexStride, VertexCount: Integer; const Indices: Pointer; IndexCount, TriStride: Integer; const Normals: Pointer); cdecl; external;
procedure dGeomTriMeshDataBuildSimple(g: dTriMeshData; const Vertices: PdReal; VertexCount: Integer; const Indices: PdTriIndex; IndexCount: Integer); cdecl; external;
procedure dGeomTriMeshDataBuildSimple1(g: dTriMeshData; const Vertices: PdReal; VertexCount: Integer; const Indices: PdTriIndex; IndexCount: Integer; const Normals: PInteger); cdecl; external;

const
  dTRIDATAPREPROCESS_BUILD__MIN = 0;
  dTRIDATAPREPROCESS_BUILD_CONCAVE_EDGES = dTRIDATAPREPROCESS_BUILD__MIN;
  dTRIDATAPREPROCESS_BUILD_FACE_ANGLES = 1;
  dTRIDATAPREPROCESS_BUILD__MAX = 2;

  dTRIDATAPREPROCESS_FACE_ANGLES_EXTRA__MIN = 0;
  dTRIDATAPREPROCESS_FACE_ANGLES_EXTRA_BYTE_POSITIVE = dTRIDATAPREPROCESS_FACE_ANGLES_EXTRA__MIN;
  dTRIDATAPREPROCESS_FACE_ANGLES_EXTRA_BYTE_ALL = 1;
  dTRIDATAPREPROCESS_FACE_ANGLES_EXTRA_WORD_ALL = 2;
  dTRIDATAPREPROCESS_FACE_ANGLES_EXTRA__MAX = 3;
  dTRIDATAPREPROCESS_FACE_ANGLES_EXTRA__DEFAULT = dTRIDATAPREPROCESS_FACE_ANGLES_EXTRA_BYTE_POSITIVE;

function dGeomTriMeshDataPreprocess2(g: dTriMeshData; buildRequestFlags: Cardinal; var requestExtraData: dintptr): Integer; cdecl; external;
function dGeomTriMeshDataPreprocess(g: dTriMeshData): Integer; cdecl; external;
procedure dGeomTriMeshDataGetBuffer(g: dTriMeshData; var buf: PByte; var bufLen: Integer); cdecl; external; deprecated;
procedure dGeomTriMeshDataSetBuffer(g: dTriMeshData; buf: PByte); cdecl; external; deprecated;

type
  dTriCallback = function(TriMesh, RefObject: dGeom; TriangleIndex: Integer): Integer; cdecl;
  dTriArrayCallback = procedure(TriMesh, RefObject: dGeom; const TriIndices: PInteger; TriCount: Integer); cdecl;
  dTriRayCallback = function(TriMesh, Ray: dGeom; TriangleIndex: Integer; u, v: dReal): Integer; cdecl;
  dTriTriMergeCallback = function(TriMesh: dGeom; FirstTriangleIndex, SecondTriangleIndex: Integer): Integer; cdecl;

procedure dGeomTriMeshSetCallback(g: dGeom; Callback: dTriCallback); cdecl; external;
function dGeomTriMeshGetCallback(g: dGeom): dTriCallback; cdecl; external;
procedure dGeomTriMeshSetArrayCallback(g: dGeom; ArrayCallback: dTriArrayCallback); cdecl; external;
function dGeomTriMeshGetArrayCallback(g: dGeom): dTriArrayCallback; cdecl; external;
procedure dGeomTriMeshSetRayCallback(g: dGeom; Callback: dTriRayCallback); cdecl; external;
function dGeomTriMeshGetRayCallback(g: dGeom): dTriRayCallback; cdecl; external;
procedure dGeomTriMeshSetTriMergeCallback(g: dGeom; Callback: dTriTriMergeCallback); cdecl; external;
function dGeomTriMeshGetTriMergeCallback(g: dGeom): dTriTriMergeCallback; cdecl; external;

function dCreateTriMesh(space: dSpace; Data: dTriMeshData; Callback: dTriCallback; ArrayCallback: dTriArrayCallback; RayCallback: dTriRayCallback): dGeom; cdecl; external;
procedure dGeomTriMeshSetData(g: dGeom; Data: dTriMeshData); cdecl; external;
function dGeomTriMeshGetData(g: dGeom): dTriMeshData; cdecl; external;
procedure dGeomTriMeshEnableTC(g: dGeom; geomClass, enable: Integer); cdecl; external;
function dGeomTriMeshIsTCEnabled(g: dGeom; geomClass: Integer): Integer; cdecl; external;
procedure dGeomTriMeshClearTCCache(g: dGeom); cdecl; external;
function dGeomTriMeshGetTriMeshDataID(g: dGeom): dTriMeshData; cdecl; external;
procedure dGeomTriMeshGetTriangle(g: dGeom; Index: Integer; var v0, v1, v2: dVector3); cdecl; external;
procedure dGeomTriMeshGetPoint(g: dGeom; Index: Integer; u, v: dReal; var OutVec: dVector3); cdecl; external;
function dGeomTriMeshGetTriangleCount(g: dGeom): Integer; cdecl; external;
procedure dGeomTriMeshDataUpdate(g: dTriMeshData); cdecl; external;

function dCreateGeomTransform(space: dSpace): dGeom; cdecl; external; deprecated;
procedure dGeomTransformSetGeom(g, obj: dGeom); cdecl; external; deprecated;
function dGeomTransformGetGeom(g: dGeom): dGeom; cdecl; external; deprecated;
procedure dGeomTransformSetCleanup(g: dGeom; mode: Integer); cdecl; external; deprecated;
function dGeomTransformGetCleanup(g: dGeom): Integer; cdecl; external; deprecated;
procedure dGeomTransformSetInfo(g: dGeom; mode: Integer); cdecl; external; deprecated;
function dGeomTransformGetInfo(g: dGeom): Integer; cdecl; external; deprecated;

type
  dxHeightfieldData = record end;
  dHeightfieldData = ^dxHeightfieldData;
  dHeightfieldGetHeight = function(p_user_data: Pointer; x, z: Integer): dReal; cdecl;

function dCreateHeightfield(space: dSpace; data: dHeightfieldData; bPlaceable: Integer): dGeom; cdecl; external;
function dGeomHeightfieldDataCreate: dHeightfieldData; cdecl; external;
procedure dGeomHeightfieldDataDestroy(d: dHeightfieldData); cdecl; external;
procedure dGeomHeightfieldDataBuildCallback(d: dHeightfieldData; pUserData: Pointer; pCallback: dHeightfieldGetHeight; width, depth: dReal; widthSamples, depthSamples: Integer; scale, offset, thickness: dReal; bWrap: Integer); cdecl; external;
procedure dGeomHeightfieldDataBuildByte(d: dHeightfieldData; const pHeightData: PByte; bCopyHeightData: Integer; width, depth: dReal; widthSamples, depthSamples: Integer; scale, offset, thickness: dReal; bWrap: Integer); cdecl; external;
procedure dGeomHeightfieldDataBuildShort(d: dHeightfieldData; const pHeightData: PSmallInt; bCopyHeightData: Integer; width, depth: dReal; widthSamples, depthSamples: Integer; scale, offset, thickness: dReal; bWrap: Integer); cdecl; external;
procedure dGeomHeightfieldDataBuildSingle(d: dHeightfieldData; const pHeightData: PSingle; bCopyHeightData: Integer; width, depth: dReal; widthSamples, depthSamples: Integer; scale, offset, thickness: dReal; bWrap: Integer); cdecl; external;
procedure dGeomHeightfieldDataBuildDouble(d: dHeightfieldData; const pHeightData: PDouble; bCopyHeightData: Integer; width, depth: dReal; widthSamples, depthSamples: Integer; scale, offset, thickness: dReal; bWrap: Integer); cdecl; external;
procedure dGeomHeightfieldDataSetBounds(d: dHeightfieldData; minHeight, maxHeight: dReal); cdecl; external;
procedure dGeomHeightfieldSetHeightfieldData(g: dGeom; d: dHeightfieldData); cdecl; external;
function dGeomHeightfieldGetHeightfieldData(g: dGeom): dHeightfieldData; cdecl; external;

procedure dClosestLineSegmentPoints(const a1, a2, b1, b2: dVector3; var cp1, cp2: dVector3); cdecl; external;
function dBoxTouchesBox(const _p1: dVector3; const R1: dMatrix3; const side1: dVector3; const _p2: dVector3; const R2: dMatrix3; const side2: dVector3): Integer; cdecl; external;
function dBoxBox(const p1: dVector3; const R1: dMatrix3; const side1: dVector3; const p2: dVector3; const R2: dMatrix3; const side2: dVector3; var normal: dVector3; var depth: dReal; var return_code: Integer; flags: Integer; var contact: dContactGeom; skip: Integer): Integer; cdecl; external;

procedure dInfiniteAABB(geom: dGeom; var aabb: dReal); cdecl; external;

type
  dGetAABBFn = procedure(geom: dGeom; var aabb: dReal); cdecl;
  dColliderFn = function(o1, o2: dGeom; flags: Integer; var contact: dContactGeom; skip: Integer): Integer; cdecl;
  dGetColliderFnFn = function(num: Integer): dColliderFn; cdecl;
  dGeomDtorFn = procedure(o: dGeom); cdecl;
  dAABBTestFn = function(o1, o2: dGeom; var aabb: dReal): Integer; cdecl;

  dGeomClass = record
    bytes: Integer;
    collider: dGetColliderFnFn;
    aabb: dGetAABBFn;
    aabb_test: dAABBTestFn;
    dtor: dGeomDtorFn;
  end;

function dCreateGeomClass(var classptr: dGeomClass): Integer; cdecl; external;
function dGeomGetClassData(g: dGeom): Pointer; cdecl; external;
function dCreateGeom(classnum: Integer): dGeom; cdecl; external;
procedure dSetColliderOverride(i, j: Integer; fn: dColliderFn); cdecl; external;

type
  dxThreadingThreadPool = record end;
  dThreadingThreadPool = ^dxThreadingThreadPool;

function dThreadingAllocateSelfThreadedImplementation: dThreadingImplementation; cdecl; external;
function dThreadingAllocateMultiThreadedImplementation: dThreadingImplementation; cdecl; external;
function dThreadingImplementationGetFunctions(impl: dThreadingImplementation): PdThreadingFunctionsInfo; cdecl; external;
procedure dThreadingImplementationShutdownProcessing(impl: dThreadingImplementation); cdecl; external;
procedure dThreadingImplementationCleanupForRestart(impl: dThreadingImplementation); cdecl; external;
procedure dThreadingFreeImplementation(impl: dThreadingImplementation); cdecl; external;

type
  dThreadReadyToServeCallback = procedure(callback_context: Pointer); cdecl;

procedure dExternalThreadingServeMultiThreadedImplementation(impl: dThreadingImplementation; readiness_callback: dThreadReadyToServeCallback; callback_context: Pointer); cdecl; external;

function dThreadingAllocateThreadPool(thread_count: Cardinal; stack_size: dsizeint; ode_data_allocate_flags: Cardinal; reserved: Pointer): dThreadingThreadPool; cdecl; external;
procedure dThreadingThreadPoolServeMultiThreadedImplementation(pool: dThreadingThreadPool; impl: dThreadingImplementation); cdecl; external;
procedure dThreadingThreadPoolWaitIdleState(pool: dThreadingThreadPool); cdecl; external;
procedure dThreadingFreeThreadPool(pool: dThreadingThreadPool); cdecl; external;

implementation

end.
