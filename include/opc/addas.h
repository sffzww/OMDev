/*
Copyright (c) 2007, VTT Digital Information Systems
All rights reserved.
See the file Eclipse Public License - Version 1_0.htm for terms and conditions of the license.
*/

/*
-------------------------------------------------------------------------------
Description: Advise Calculation Level Data Access Interface. A low level c
interface for calculation levels who which to join the Advise Federation.
The counterpart of one calculation level is an user interface (usually the
Advise Studio).

Note that the library assumes that the library routines are called from
one thread but the library can call the callback functions from many
different threads.
-------------------------------------------------------------------------------
*/

#ifndef addas_h
#define addas_h

#define ADDAS_EXPORTS

#ifdef ADDAS_EXPORTS /* Defined when building the library. */
#define ADDAS_DECL __declspec(dllexport)
#else
#define ADDAS_DECL __declspec(dllimport)
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
YOU HAVE TO TAKE INTO ACCOUNT FOLLOWING NOTICE WITH EVERY FUNCTION COMMENTED WITH "NOTE MEMORY": 
CLIENT RESERVES MEMORY WITH MALLOC AND KIT RELEASES THE MEMORY USING FREE

Output array parameters of the functions has pointer (*) notation when memory is allocated by 
the client and array [] notation when memory is allocated by the kit

Multithreading and synchronization issues: adda interface is designed to allow multithreaded behavior.
Because function calls are executed to both directions, neither one component should keep
resources that can be accessed using adda-interface functions, locked during function calls. 
There are some extra notifications, related to synchronization issues, that are important 
to take care when implementing addasConfigurationChanged, addasDataChanged, addasRemoveItems 
or addasRemoveGroup functions.

*/

/* The possible data types. */

// ifndef is because of the mxlda server that includes addas.h through
// the adxmls.h
#ifndef AddaEnumsAndStructs
#define AddaEnumsAndStructs


enum AddaModuleId {
	COMDAKit,
	XMLDAKit

};

enum AddaDataType {
    AddaBool,	/* 4 bytes, 0 if false, otherwice true. */
    AddaChar,	/* 1 byte */
    AddaShort,	/* 2 bytes */
    AddaInt,	/* 4 bytes */
    AddaFloat,	/* 4 bytes */
    AddaDouble, /* 8 bytes */
    AddaString /* pointer (char*) to a sequence of chars which
                ends in null (\0) char. The handling of string data is not
                as effective as other data types because here the library
                has to copy the pointed characters to internal buffer before
                it can deliver them to the user interface. */
};

/* The possible quality values. */
enum AddaQuality {
    AddaOk, /* Values retuned with dataChanged are good. */
    AddaBad, /* Values retuned with dataChanged are not good. Don't use them. */
    AddaReadOnly, /*	Values retuned with dataChanged are good. Values written are ignored. 
						This is not supported by OPC KIT or Front yet....
				  */
    AddaInvalid /* Item does not exist. */
};

/* Syncronization point states. */
enum AddaSyncPointState {
	AddaActive, /*Sync point is active and simulator will stop its execution to this point*/
	AddaPassive /*Sync point is passive and simulator will not stop its execution to this point*/
};

/* Boolean for adda. */
enum AddaBoolean {
	AddaFalse, 
	AddaTrue 
};

struct AddaDataItem {
    char* id;				/* Data item id. */
    AddaDataType type;		/* Type of the item. */
    int size;				/* Size of the item data vector. (Every data item is a vector!) */
    void* data;				/* Pointer to Front data */
    int groupId;			/* Data item group. */
    AddaQuality quality;
	void* frontItem;		/* Pointer to the frontItem, must be set in ConfigurationChange. 
							   Used in addasWrite*/
	double* time;			/* Pointer to time (simulation time in seconds) that contains
							item specific time, if shuch should be used instead of group specific time*/
};

/* Value structure used for all attribute and item property information*/
struct AddaValue {
	AddaDataType dataType;
	int size;
	AddaQuality status;
	union {
		int boolValue;
		short shortValue;
		int integerValue;
		float floatValue;
		double doubleValue;
		char charValue;
		char *stringValue;

		int* boolVectorValue;
		short* shortVectorValue;
		int* integerVectorValue;
		float* floatVectorValue;
		double* doubleVectorValue;
		char* charVectorValue;
		char** stringVectorValue;

	};
};

#else
#endif

	
/* Utility routines. */
/*********************/


/* Get version.
If major and minor argument pointers are not null returns major and minor
version numbers. Major version number is changed when the (shared) library
is not downwards compatible with the old library (the name of the library
contains the major number e.g. addas.dll). Minor version number is changed
when the interface is changed, but the (shared) library is still downward
compatible with the old clients (e.g. you can replace the old library with
the new and library clients will still work without recompilation. 

NOT IN USE!
*/
extern ADDAS_DECL void addasVersion(int* apMajor, int* apMinor);

/* 
Returns the size of the last error message. If not null then apBuffer
is used to return the last error message. If the buffer size isn't big
enough the message is truncated. The message will always end with null (\0). 

*/
extern ADDAS_DECL int addasRegGetLastError(int aSize, char* apBuffer);


/* 
Register logging function pointer for messages. Parameter aNro is used to indicate 
whether the log-message describes serious error or quite normal behavior. Serious error
is 0 and normal behavior is 1. Typical serious errors are initialization errors etc.
*/
extern ADDAS_DECL int addasRegLogMessage(int(*)(char *aMessage, int aNro));


extern ADDAS_DECL int addasRegReadyToQuit(int(*)(AddaModuleId aModuleId));

/* 
Register function that is called when Front client starts to use
interface functions. i.e. this is always the first function that is called.
This must also be called if the function call before this has been addasReadyToQuit.
*/
extern ADDAS_DECL int addasRegOpenConnection(int(*)(AddaModuleId aModuleId));

/* 
Register ExecuteSimulatorCommand function pointer. The actual function executes a command, may contain command parameters. Returs 0 if succeeded.
If command generates any kind of repy message, errors or warnings, output is used to notify caller.
NOTE MEMORY! 
*/
extern ADDAS_DECL int addasRegExecuteSimulatorCommand(int(*)(const char* command, char** output));


/* Data access routines. */
/*************************/

/*
This interface is meant to support the data exchange during the
simulation cycles. The simulator is the data source, producing
new set of data values during each cycle. The simulator keeps
its own time (=simulated time).
*/

/* Services */
/* ----------*/



/* 
Use this to notify that simulator has changed the set of
data items in transfer or that their datapointers, pointers to the FrontItems
or qualities have changed. The parameters are the number of data items and the data items in
transfer. Return: 0 = ok, -1 = error.
Use GetLastError routine to get more detailed error message. 

If ConfigurationChanged call is generated because items have been removed from Front
-> AddaDataItem field void* frontItem == NULL and AddaQuality == AddaInvalid;

The only adda-interface function call that generates ConfigurationChanged event is 
addasAddItems. However if items are removed by someone else or their qualities changes configurationChanged
events are generated. In these situations a Front component should not remove the items related
before sending ConfigurationChanged event.
*/
extern ADDAS_DECL int addasConfigurationChanged(int aNumberOfItems, AddaDataItem* apItems[]);

/*	
Use this to notify that data has changed. Function is group-specific.
Typical implementation of this function is to loop all items in group
and copy the value from Front to Kit's cache if values is changed

This fuction access the database of Front, however it is not a good idea to 
hold any kind of resourses reserved when addasDataChanged function is called. This may propably
affect a deadlock. Forexample it is typical situation that addasWrite has to be able to
execute while addasDataChanged is on. Function uses pointers to data defined in addasConfigurationChanged
to access the database of the Front.
*/
extern ADDAS_DECL int addasDataChanged(double aCLTime, int aGroupId);

/*	
Use this to notify that data has changed. Function is group-specific.
Use this function when you know exactly which items have changed. 
This situation arises e.g. after addasWrite operation and when OPCKit
has called adopcsExecuteSimulatorCommand that modifies some item that OPCKit
observes. 

Function is useful all these situations when just few items have changed and
knowledge about this is available. Prefer addasDataChanged in normal cyclic
data exchange loop.
*/
extern ADDAS_DECL int addasDataChanged2(double aCLTime, int aGroupId, int aNroOfItems, AddaDataItem* apItems[]);


/* Callbacks */
/*-----------*/

/*
Each callback registration routine returns 0 if ok. Each callback
must be registered before calling Init utility routine and should not
be changed after that.

Each callback routine returns 0 if the callback routine has succeeded
and the output arguments are as specified with the callback routine
definition. If callback returns 1 then the operation failed and output
arguments are not valid. Callback specific error codes are defined with
the callback register routine.
*/

/* Register data check item ids routine. This is called when the user
interface wants to check the existence of items. The apItemsIds, apExist
tables must are at least aNumberOfItems big. The id field of
apItemIds elements must be filled. Front fills the type field with
right datatype and size. On return the apExist table must contain 0 if the item id
does not exist and 1 if it exists.


Callback specific errors: none. */
extern ADDAS_DECL int addasRegCheckItemIds(int(*)(int aNumberOfItems, AddaDataItem apItemIds[], int apExist[]));

/* Register write callback. Called when user interface wants to change
the value of simulator data items. You can return immediately
after you have copied the values to your own variables. You don't have
to wait until the current calculation cycle has ended and the values
are actually written into the calculation structures. If same
value is changed twice between calculation cycles then only the last
value needs to be delivered. The parameters are sizes of the index
vectors (can be zero), indexes, sizes of data vectors, and data vectors. 

apAddaItems gives the same information which is given in addasConfigurationChanged()
it contains the same pointers to Front data. apData table contains pointers to the data 
in OPCKIT/Adda dll. They are in same order as AddaDataItems. 

Note: If items does not anymore exists or it's attributes (iDim, charLength) has changed
then it's quality is AddaInvalid and this information is filled to the adAddaItems quality field
by addasWrite function. If this is case the no write operation is done for this item
and addasWrite returns 1. If all writes succeeded then returns 0.
*/

extern ADDAS_DECL int addasRegWrite(int(*)(int aSize, AddaDataItem* apAddaItems[], void** apData));

/*
Register query dataChanged callback. Called when user interface wants to force
an dataChanged-callback as soon as possible. Used especially in OPC Kit's Device Read
and Device Refresh cases. Returns 0 when (adopcs)DataChanged has been called AND RETURNED
for this group, i.e. new values are copied to the Kit (if they are changed)  

Returns 1 if fuction failed, e.g group was not found
*/
extern ADDAS_DECL int addasRegQueryDataChanged(int(*)(int aGroupId));

/* Register add group callback. Called when user interface wants to add
a new group to the data communication. Default frequency is simulator
specific. You can get it with get frequency. Returns a new group id
(zero if error). Callback specific errors: none. */
extern ADDAS_DECL int addasRegAddGroup(int(*)(AddaModuleId aModuleId, int* aGroupId));

/* Register delete group callback. Called when user interface wants to delete
a group from the data communication. If group contains items which have not
been deleted yet, DelGroup also removes them. After this routine you can not call any
function with the deleted group id. Callback specific errors: none. 

NEW NOTE: FrontClient should remove own group-related data-structures before it calls
addasDelGroup function. 
*/
extern ADDAS_DECL int addasRegDelGroup(int(*)(int aGroupId));

/* Register change frquency callback. Called when user interface wants to
change group frequency. If returns 3 you must check with get frequency what
the nearest supported frequency is. If 3 is returned function sets automatically
the nearest possible frequency, taht can be queried with GetFrequency function. 
Frequency is given in seconds.
Callback specific errors: 2 = Illegal frequency. 3 = Unsupproted frequency. */
extern ADDAS_DECL int addasRegChangeFrequency(int(*)(int aGroupId, double aFreq));

/* Register get frquency callback. Called when user interface wants to
get group frequency. Callback specific errors: none. */
extern ADDAS_DECL int addasRegGetFrequency(int(*)(int aGroupId, double* aFreq));

/* Register add items callback. Called when user interface wants to add
items to the data communication. addasAddItems function fills fields
.data, .size, .frontItem and .quality in aItemId strcture table. 
Note that it is an implementation detail what quality addasAddItems returns. 
Callback specific errors: none.

Note that aItemIds table CAN contain id's of items which are allready
added to the communication. Front CAN or CANNOT make duplicate items in group.
However, Front client removes all possible duplicate items with single 
addasRemoveItems function-call. (from the current group ofcourse).

Front doesn't have to indicate in any way to Front client whether there allready was
the same item in communication in currrent group. 
*/
extern ADDAS_DECL int addasRegAddItems(int(*)(int aSize, AddaDataItem aItemIds[]));

/* Register remove items callback. Called when user interface wants to
remove items to the data communication. Items must be on the given group.

Note that If FrontClient has the same item several times in the same (OPC)Group
it cannot remove item, until it removes the last item from the group.

Front has to take care that it dont't remove item if it still is the member of
some other group. However it is the implementation detail, wether the FrontItems
are "singletons". It is one possible strategy that Front creates one FrontItem for
all Groups... Little bit confusing..

NEW NOTE: A FrontClient has to remove own item-related datastructures before it calls 
addasRemoveItems function.
//
Callback specific errors: none. */
extern ADDAS_DECL int addasRegRemoveItems(int(*)(int aSize, AddaDataItem aItemIds[]));

/* Browse routines. */
/*************************/

/*	-Its up to Front clients to keep up browse position. Front client can query branches and leaves
	by giving current browse position.
	
	-Separation char is used instead of separation string

	-No root name is needed in path e.g. moduleType!moduleName  NOT rootName!moduleType!moduleName
	
	-If query is done for root *apPath = null

	-If current level doesn't contain leaves/branches *apCount = 0

	-If current postion is not valid *apCount ==0 && *apBranches ==null

*/

/* Get list of leaves in the current navigation tree position.*/
/*NOTE MEMORY*/
extern ADDAS_DECL int addasRegGetLeaves(int(*)(int *apCount, char ***apLeaves, const char* apPath, int aPathLen));

/* Get leaf identifier, should identify each leaf uniquely.*/
/*NOTE MEMORY*/
extern ADDAS_DECL int addasRegGetLeafId(int(*)(const char *apLeaf, const char* apPath, int aPathLen, char **apLeafId));

/* Get leaf id type.*/
extern ADDAS_DECL int addasRegGetLeafIdType(int(*)(const int aCount, const char **apLeaf, const char* apPath, int aPathLen, AddaDataType aTypes[], int aSize[]));

/* Get list of branches in the current navigation tree position.*/
/*NOTE MEMORY*/
extern ADDAS_DECL int addasRegGetBranches(int(*)(int *apCount, char ***apBranches, const char* apPath, int aPathLen));


/* Get navigation tree root name.*/
/*NOTE MEMORY*/
extern ADDAS_DECL int addasRegRootName(int(*)(char **apRootName));

/* Return true if application has a flat name space.*/
extern ADDAS_DECL int addasRegIsFlat(int(*)(AddaBoolean *apFlat));

/* Get separation character, used between parts of a tree item name.*/
/* Returns char. Separation char can be any character (also '\0') */
extern ADDAS_DECL int addasRegSeparation(char(*)(void));    
 
/* 
	Return available property ids, descriptions and property types for given item
	NOTE MEMORY. returns 0 if ok, 1 if invalid itemId, 2 if some other error.

	Available properties (and corresponding descriptions and data types) are:

	1 dataType				[Item Canonical Data Type]	[double 8byte], first 4 bytes are AddaDatatype (enum) and last 4 byte size (int) (little bit ugly..)
	2 value					[Item Value]				[varying]
	3 quality				[Item Quality]				[int, size=1]
	4 timestamp				[Item Timestamp]			[int, size=1]		(in millisecnos time_t format)
	5 accessRights			[Item Access rights]		[int, size=1]		(qualityGood = 1, qualityBad = 0)
	100 engineeringUnits	[EU units]					[string, size=1]
	102 highEU				[high EU]					[double, size=1]
	103 lowEU				[low EU]					[double, size=1]
	104 highIR				[High Instrument Range]		[double, size=1]
	105 lowIR				[Low instrument range]		[double, size=1]

*/
/*NOTE MEMORY*/
extern ADDAS_DECL int addasRegQueryAvailableProperties(int(*)(const char *apItemId, int *apCount, int **apIds, char ***apDescriptions, AddaDataType **apTypes, int** apSizes));

/* 
Return property values for given item and success codes for every available property (true/false)
NOTE MEMORY! when AddaValue has string data or vector-valued data. 

   Returns 0 if succesful, 1 if invalid itemId, 2 if error was some other reason.

	NOTE 2!!! special cases:

   Example1: If propertyID = 1 (dataType), addasGetItemProperties fills aData[i].dataType and aData[i].size filds
   and doens't use value-union!!!!!, 

   Example 2: If PropertyID = 2 (value), addasGetItemProperties fills aData[i].dataType and aData[i].size
   and aData[i].xxxxxValue field. 

   These two properties are some kind of special cases, for all other itemPropertyIDs AddaValue table
   contains type, size and corresponding AddaValue field subject to dataType.
*/ 
extern ADDAS_DECL int addasRegGetItemProperties(int(*)(const char *apItemId, const int apCount, const int *apIds, AddaValue aData[],  int aResults[]));

/* 
Return potential item ids for given properties for given item. If these item ids does not exist or they are otherwise not usable return error codes (false).
NOTE MEMORY Returns 0 if ok 1 if itemId was not found or apCount == 0.
If corresponding ItemId is not available apItemIds contains pointer to NULL for these items.Note that
Caller of this function must not free memory if itemId was not available for some property.
*/
extern ADDAS_DECL int addasRegLookupItemIds(int(*)(const char *apItemId, const int apCount, const int *apIds, char ***apItemIds, int aResults[]));


/* 
	Return available property ids, descriptions and property types for given item
	NOTE MEMORY. returns 0 if ok, 1 if invalid itemId, 2 if some other error.

	Available properties (and corresponding descriptions and data types) are:

	1 dataType				[Item Canonical Data Type]	[double 8byte], first 4 bytes are AddaDatatype (enum) and last 4 byte size (int) (little bit ugly..)
	2 value					[Item Value]				[varying]
	3 quality				[Item Quality]				[int, size=1]
	4 timestamp				[Item Timestamp]			[int, size=1]		(in millisecnos time_t format)
	5 accessRights			[Item Access rights]		[int, size=1]		(qualityGood = 1, qualityBad = 0)
	100 engineeringUnits	[EU units]					[string, size=1]
	102 highEU				[high EU]					[double, size=1]
	103 lowEU				[low EU]					[double, size=1]
	104 highIR				[High Instrument Range]		[double, size=1]
	105 lowIR				[Low instrument range]		[double, size=1]

*/


//
//---------------------------------------------------------------------------

#ifdef __cplusplus
}
#endif

#endif /* addas_h */

