/*
Copyright (c) 2007, VTT Digital Information Systems
All rights reserved.
See the file Eclipse Public License - Version 1_0.htm for terms and conditions of the license.
*/

/*
Declarations for OPC specific features of Advice OPC Kit. Together with ADDAS.h this header forms 
the interface for Advice OPC Kit
*/      

#ifndef ADOPCS_h
#define ADOPCS_h

/*
AdviceOPCKit.dll is used together with addas.dll. Some of the interface 
functions are same for both libraries. For this reason addas.h is used
here and some precompiler macros are defined to avoid name collission.

YOU HAVE TO TAKE INTO ACCOUNT FOLLOWING NOTICE WITH EVERY FUNCTION COMMENTED WITH "NOTE MEMORY": 
CLIENT RESERVES MEMORY WITH MALLOC AND KIT RELEASES THE MEMORY USING FREE

Output array parameters of the functions has pointer (*) notation when memory is allocated by 
the client and array [] notation when memory is allocated by the kit

*/

/* define new prefix:es for function names*/
/*#define addasInit adopcsInit*/
#define addasSetModuleId adopcsSetModuleId
#define addasVersion adopcsVersion
#define addasGetLastError adopcsGetLastError
#define addasConfigurationChanged adopcsConfigurationChanged
#define addasDataChanged adopcsDataChanged
#define addasDataChanged2 adopcsDataChanged2
#define addasStopped adopcsStopped
#define addasStarted adopcsStarted
#define addasRegCheckItemIds adopcsRegCheckItemIds
#define addasRegQueryDataChanged adopcsRegQueryDataChanged
#define addasRegWrite adopcsRegWrite
#define addasRegAddGroup adopcsRegAddGroup
#define addasRegDelGroup adopcsRegDelGroup
#define addasRegChangeFrequency adopcsRegChangeFrequency
#define addasRegGetFrequency adopcsRegGetFrequency
#define addasRegAddItems adopcsRegAddItems
#define addasRegRemoveItems adopcsRegRemoveItems

#define addasRegExecuteSimulatorCommand adopcsRegExecuteSimulatorCommand
#define addasRegLogMessage adopcsRegLogMessage
#define addasRegReadyToQuit adopcsRegReadyToQuit
#define addasRegOpenConnection adopcsRegOpenConnection

#define addasRegRun adopcsRegRun
#define addasRegStop adopcsRegStop
#define addasRegLoad adopcsRegLoad
#define addasRegSave adopcsRegSave

#define addasRegGetLeaves adopcsRegGetLeaves
#define addasRegGetLeafId adopcsRegGetLeafId
#define addasRegGetLeafIdType adopcsRegGetLeafIdType
#define addasRegGetBranches adopcsRegGetBranches
#define addasRegCurrentPosition adopcsRegCurrentPosition
#define addasRegRootName adopcsRegRootName
#define addasRegIsFlat adopcsRegIsFlat

#define addasRegUp adopcsRegUp
#define addasRegIsTop adopcsRegIsTop
#define addasRegMove adopcsRegMove
#define addasRegQueryAvailableProperties adopcsRegQueryAvailableProperties
#define addasRegGetItemProperties adopcsRegGetItemProperties
#define addasRegLookupItemIds adopcsRegLookupItemIds


#define addasRegPrefix adopcsRegPrefix
#define addasRegSuffix adopcsRegSuffix
#define addasRegLevel adopcsRegLevel
#define addasRegSeparation adopcsRegSeparation
#define addasRegFree adopcsRegFree


// Is addas.h already included
#ifndef addas_h
#include "addas.h"
// Undefine addas_h so that user can include again addas.h
#undef addas_h
// Undefine also adopcs prefix:es
//#undef addasInit
#undef addasSetModuleId
#undef addasVersion
#undef addasGetLastError
#undef addasConfigurationChanged
#undef addasDataChanged
#undef addasDataChanged2
#undef addasStopped
#undef addasStarted
#undef addasRegCheckItemIds
#undef addasRegQueryDataChanged
#undef addasRegWrite
#undef addasRegAddGroup
#undef addasRegDelGroup
#undef addasRegChangeFrequency
#undef addasRegGetFrequency
#undef addasRegAddItems
#undef addasRegRemoveItems

#undef addasRegExecuteSimulatorCommand
#undef addasRegLogMessage
#undef addasRegReadyToQuit
#undef addasRegOpenConnection

#undef addasRegRun
#undef addasRegStop
#undef addasRegLoad
#undef addasRegSave

#undef addasRegGetLeaves 
#undef addasRegGetLeafId 
#undef addasRegGetLeafIdType 
#undef addasRegGetBranches
#undef addasRegCurrentPosition
#undef addasRegRootName 
#undef addasRegIsFlat
#undef addasRegUp 
#undef addasRegIsTop
 

#undef addasRegMove 
#undef addasRegQueryAvailableProperties 
#undef addasRegGetItemProperties 
#undef addasRegLookupItemIds 
#undef addasRegPrefix 
#undef addasRegSuffix 
#undef addasRegLevel
#undef addasRegSeparation 
#undef addasRegFree 



// If addas.h was included undefine addas_h and include addas.h again
#else
#undef addas_h
#include "addas.h"
#endif

/* Define ADOPCS_DLL macro before compiling if you are making the dynamic link library.*/
#define ADOPCS_DLL   //oma #define

/* Dll code.*/
#ifdef ADOPCS_DLL
#define ADOPCS_DECL __declspec(dllexport)
/* User code.*/
#else /* DLL*/
#define ADOPCS_DECL __declspec(dllimport)
#endif /* ADOPCS_DLL*/

#ifdef __cplusplus
extern "C" {
#endif

/*------------------------------------------------------------------------------------------------*/
/*Init and exit functions*/


/*	
Initialize OPCKit by giving name of OPCServer 
i.e full ApplicationId (VTT.AprosOPCServer+Project+WorkSpace.1)
*/
extern ADOPCS_DECL int adopcsInit(const char* apOPCName, AddaModuleId aModuleId);

extern ADOPCS_DECL int adopcsExit(void);

/* 
Registers GetOPCProperties function. The actual function returns parameters that OPCKit
need to know. These paramameters cannot be marshalled adopcsInit function because
user of the simulator has to have a possibility to configure these values before
she starts connecting OPCServer.

Properties are:		synchronizationState, 0 if false, 1 if true
					aSendAll,	that can be set 1 if all values are wanted whether they change or not (default = 0)
					aTimeOut,	float value that tells how long OPCKit will wait events back from client until
								it decides client has died.

TEEMULLE HUOM: Korvaa funktion adopcsGetSynchronizationState()
*/
extern ADOPCS_DECL int adopcsRegGetOPCProperties(int(*)(int* aSynchronizationState, int* aSendAll, 
														float* aTimeOut));

/*
With this function Front can notify it's clients that dataChange configurations have
changed. Returns 0 if succeeded, 1 if error. One typical error would be that
simulationstate is on of three possible run-state. This function is allowed to
be called only when the simulation is stopped i.e. AdopcsSimulationState == Stopped ||
StoppedRecording || StoppedPlaying.

TEEMULLE HUOM! UUSI funktio, joka tarvitaan jotta OPCKit saisi
uudet konfiguraatiot kun luetaan uusi snapperi. OPC modulihan on snapperikohtainen
*/
extern ADOPCS_DECL int adopcsOPCPropertiesChanged(int aSynchronizationState, int aSendAll, 
														float aTimeOut);


/*---------------------------------------------------------------------
	Simulation control interface
*/
/*
Register Run function. The actual function starts simulating and returns 0 if succeeded
1 otherwice. If aTime is negative simulation continues undeterminely. If aTime is positive, simulation will continue 
as many seconds.
*/	
extern ADOPCS_DECL int adopcsRegRun(int(*)(double aTime));

/*
Register Stop function. The actual function stops simulating and returns 0 if succeeded
1 otherwice.
*/	
extern ADOPCS_DECL int adopcsRegStop(int(*)(void));

/*
Register Step function. The actual function simulates one step further. Returns 0 if succeeded
1 otherwice.
*/
extern ADOPCS_DECL int adopcsRegStep(int(*)(void));

extern ADOPCS_DECL int adopcsRegQueryAvailableSimulationItemIDs(int(*)(	int* aCount, 
																		int** aSimulationProperties,
																		char*** aSimulationItemIDs,
																		char*** aDescriptions,
																		AddaDataType** aDataTypes,
																		int** aSizes));

/*-------------------------------------------------------------------------------------------
	Persist File interface
	
	Register your own implementation for the call back functions declared here.
	With these four functions a client can save and load configurations of the simulator
	database behind the adda-interface.
*/

/*
The actual function loads the specified configuration file that can contain
e.g. database of the simulator. This configuration file is not related to
client specific concepts like items or groups.
*/
extern ADOPCS_DECL int adopcsRegLoad(int(*)(char* aFileName));

/*
The actual function saves the current configuration. If some old file has the same
name, it will be overwritten without warnings. If no such file exist, a new one is created.
*/
extern ADOPCS_DECL int adopcsRegSave(int(*)(char* aFileName));

/*
Actual function gets the name of the current configuration file. Returns 0 if succeeded
NOTE MEMORY!
*/
extern ADOPCS_DECL int adopcsRegGetCurrentConfigurationFile(int(*)(char** aFileName));

/*
Actual function sets aDirty = 0, if current configuration file is dirty, 1 otherwice.
Returns 0 if succeeded otherwice 1.
*/
extern ADOPCS_DECL int adopcsRegIsDirty(int(*)(int* aDirty));



/*------------------------------------------------------------------------------------------------*/
/* Training control interface
   Register your own implementation for the call back functions declared here.*/


/* Condition attributes for malfunctions*/
struct AdopcsCondition{
	int mNumOfAttributes;
	char **mAttrNames;
	AddaValue *mAttributes;
};

/* Malfunction states, simulation states and recording states*/
enum AdopcsState { AdopcsActive = 1, AdopcsPassive, AdopcsTriggered};

#ifndef AdopcsEnumsAndStructs
#define AdopcsEnumsAndStructs

enum AdopcsSimulationState {AdopcsStopped,			/* simulation is stopped, not recording on */
							AdopcsDiverged,			/* simulation has stopped because of diverging */
							AdopcsRunning,			/* simulation is running, not recording on */
							AdopcsStoppedRecording,	/* simulation is recording, but not currently running */
							AdopcsDivergedRecording,
							AdopcsRunningRecording,	/* simulation is recording and running */
							AdopcsStoppedPlaying,	/* simulation is playing old records, but not currently running */
							AdopcsDivergedPlaying,
							AdopcsRunningPlaying,	/* simulation is playing old records and running */
							AdopcsBusy,				/* simulator is doing operations and is busy */
							AdopcsUnknown			/* simulator state is undetermined */
							};

#else
#endif

/* 
Notifies client that simulation or recording state has changed. Time is a current simulation time
from the beginning of the simulation in seconds. 
*/
extern ADOPCS_DECL int adopcsStateChange(double aSimulationTime, AdopcsSimulationState aSimulationState);


/* 
Register Start recording function pointer. The actual function can be used to query the current
state of simulator. Typically this function is needed to generate first event to OPCClient. After that
OPCKit can trust that Front will send adopcsStateChange events. 
*/
extern ADOPCS_DECL int adopcsRegGetState(int(*)(double* aTime, AdopcsSimulationState* aSimulationState));

/* 
Notifies client that somebody has given the command "action log". Paramter is the reply string
generated by action log command
*/
extern ADOPCS_DECL int adopcsActionLog(const char* aActionLog);


/* Register Start recording function pointer. The actual function starts to record simulation events.*/
extern ADOPCS_DECL int adopcsRegRecordingStart(int(*)(void));

/* Register Stop recording function pointer. The actual function stops recording simulation events.*/
extern ADOPCS_DECL int adopcsRegRecordingStop(int(*)(void));

/* Register Wind function pointer. The actual function winds to the requested time. 
   The actual point where the wind ended is returned in revised time.*/
extern ADOPCS_DECL int adopcsRegWind(int(*)(const double aRequestedTime, double *aRevisedTime));


extern ADOPCS_DECL int adopcsRegQueryAvailableRecordingItemIDs(int(*)(	int* aCount, 
																		int** aRecordingProperties,
																		char*** aRecordingItemIDs,
																		char*** aDescriptions,
																		AddaDataType** aDataTypes,
																		int** aSizes));
/* 
Register recording range function pointer. The actual function returns the 
begin and end times for the recording. Returns 0 if succeeded, 1 if recording times 
were not available and 2 if function failed for some other reason.
*/
extern ADOPCS_DECL int adopcsRegGetRecordingRange(int(*)(double *aBeginTime, double *aEndTime));

/* Register replay function pointer. The actual function starts replaying from the current location*/
extern ADOPCS_DECL int adopcsRegReplay(int(*)(void));

/*Register list malfunctions function pointer. The actual function returns the malfunctions 
  (and descriptions for them) configured to the simulation model.*/
/*NOTE MEMORY*/
extern ADOPCS_DECL int adopcsRegListMalfunctions(int(*)(int *aCount, char ***aNames, char ***aDescriptions));

/* Register get malfunction state function pointer. The actual function returns 
   the state of the given malfunction*/
extern ADOPCS_DECL int adopcsRegGetMalfunctionState(int(*)(const char *aName, AdopcsState *aState));

/* Register set malfunction state function pointer. The actual function sets 
   the state of the given malfunction.*/
extern ADOPCS_DECL int adopcsRegSetMalfunctionState(int(*)(const char *aName, const AdopcsState aState));

/*Register query available condition attributes function pointer. The actual function returns 
  a list of available condition attributes, descriptions and datatypes.*/
/*NOTE MEMORY*/
extern ADOPCS_DECL int adopcsRegQueryAvailableConditionProperties(int(*)(int *aCount, char ***aNames, char ***aDescriptions, AddaDataType **aDataTypes, int** aSizes));

/*Register get condition function pointer. The actual function returns the data 
  (including all the attributes) related to the given condition*/
/*NOTE MEMORY*/
extern ADOPCS_DECL int adopcsRegGetConditions(int(*)(const char *aName,AdopcsCondition *aCondition));

/*Register set condition function pointer. The actual function sets the data related 
  to the given condition. A Front client is responsible to ensure with queryAvaliable
  ConditionProperties function that ConditionAttributes she is asking are valid. SetConditions function
  have to check that aName represents a valid malfunction. If such a name is not in a namespace of
  the simulator, then returnvalue is 1, otherwice 0.
*/
extern ADOPCS_DECL int adopcsRegSetConditions(int(*)(const char *aName,const AdopcsCondition aCondition));

/* Frees the given memory address. */
extern ADOPCS_DECL int adopcsRegFree(int(*)(void *aPointer));


#ifdef __cplusplus
}
#endif

#endif
