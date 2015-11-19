#ifndef __c2_WECSim_Lib_h__
#define __c2_WECSim_Lib_h__

/* Include files */
#include "sf_runtime/sfc_sf.h"
#include "sf_runtime/sfc_mex.h"
#include "rtwtypes.h"
#include "multiword_types.h"

/* Type Definitions */
#ifndef typedef_SFc2_WECSim_LibInstanceStruct
#define typedef_SFc2_WECSim_LibInstanceStruct

typedef struct {
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint32_T chartNumber;
  uint32_T instanceNumber;
  int32_T c2_sfEvent;
  boolean_T c2_isStable;
  boolean_T c2_doneDoubleBufferReInit;
  uint8_T c2_is_active_c2_WECSim_Lib;
  real_T c2_velocity[36006];
  boolean_T c2_velocity_not_empty;
  real_T c2_kkk;
  boolean_T c2_kkk_not_empty;
  real_T c2_oldTime;
  boolean_T c2_oldTime_not_empty;
  real_T c2_oldF_FM[6];
  boolean_T c2_oldF_FM_not_empty;
  real_T c2_inData[216036];
  real_T c2_u[216036];
  real_T c2_IRKB[216036];
  real_T c2_dv3[36000];
  real_T c2_CTTime[6001];
  real_T c2_tmpV[6001];
  real_T c2_dv2[36006];
  real_T c2_dv5[36006];
  real_T c2_b_inData[36006];
  real_T c2_b_u[36006];
  real_T c2_c_u[36006];
  real_T c2_y[36006];
  real_T (*c2_lenJ)[6];
  real_T (*c2_v)[6];
  real_T (*c2_F_FM)[6];
  real_T (*c2_b_IRKB)[216036];
  real_T (*c2_b_CTTime)[6001];
  real_T *c2_clockTime;
  real_T *c2_numIntMidTimeSteps;
} SFc2_WECSim_LibInstanceStruct;

#endif                                 /*typedef_SFc2_WECSim_LibInstanceStruct*/

/* Named Constants */

/* Variable Declarations */
extern struct SfDebugInstanceStruct *sfGlobalDebugInstanceStruct;

/* Variable Definitions */

/* Function Declarations */
extern const mxArray *sf_c2_WECSim_Lib_get_eml_resolved_functions_info(void);

/* Function Definitions */
extern void sf_c2_WECSim_Lib_get_check_sum(mxArray *plhs[]);
extern void c2_WECSim_Lib_method_dispatcher(SimStruct *S, int_T method, void
  *data);

#endif
