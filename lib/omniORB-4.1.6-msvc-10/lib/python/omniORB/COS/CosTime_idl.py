# Python stubs generated by omniidl from ..\..\..\..\..\idl\COS\CosTime.idl

import omniORB, _omnipy
from omniORB import CORBA, PortableServer
_0_CORBA = CORBA

_omnipy.checkVersion(3,0, __file__)

# #include "TimeBase.idl"
import TimeBase_idl
_0_TimeBase = omniORB.openModule("TimeBase")
_0_TimeBase__POA = omniORB.openModule("TimeBase__POA")

#
# Start of module "CosTime"
#
__name__ = "CosTime"
_0_CosTime = omniORB.openModule("CosTime", r"..\..\..\..\..\idl\COS\CosTime.idl")
_0_CosTime__POA = omniORB.openModule("CosTime__POA", r"..\..\..\..\..\idl\COS\CosTime.idl")


# enum TimeComparison
_0_CosTime.TCEqualTo = omniORB.EnumItem("TCEqualTo", 0)
_0_CosTime.TCLessThan = omniORB.EnumItem("TCLessThan", 1)
_0_CosTime.TCGreaterThan = omniORB.EnumItem("TCGreaterThan", 2)
_0_CosTime.TCIndeterminate = omniORB.EnumItem("TCIndeterminate", 3)
_0_CosTime.TimeComparison = omniORB.Enum("IDL:omg.org/CosTime/TimeComparison:1.0", (_0_CosTime.TCEqualTo, _0_CosTime.TCLessThan, _0_CosTime.TCGreaterThan, _0_CosTime.TCIndeterminate,))

_0_CosTime._d_TimeComparison  = (omniORB.tcInternal.tv_enum, _0_CosTime.TimeComparison._NP_RepositoryId, "TimeComparison", _0_CosTime.TimeComparison._items)
_0_CosTime._tc_TimeComparison = omniORB.tcInternal.createTypeCode(_0_CosTime._d_TimeComparison)
omniORB.registerType(_0_CosTime.TimeComparison._NP_RepositoryId, _0_CosTime._d_TimeComparison, _0_CosTime._tc_TimeComparison)

# enum ComparisonType
_0_CosTime.IntervalC = omniORB.EnumItem("IntervalC", 0)
_0_CosTime.MidC = omniORB.EnumItem("MidC", 1)
_0_CosTime.ComparisonType = omniORB.Enum("IDL:omg.org/CosTime/ComparisonType:1.0", (_0_CosTime.IntervalC, _0_CosTime.MidC,))

_0_CosTime._d_ComparisonType  = (omniORB.tcInternal.tv_enum, _0_CosTime.ComparisonType._NP_RepositoryId, "ComparisonType", _0_CosTime.ComparisonType._items)
_0_CosTime._tc_ComparisonType = omniORB.tcInternal.createTypeCode(_0_CosTime._d_ComparisonType)
omniORB.registerType(_0_CosTime.ComparisonType._NP_RepositoryId, _0_CosTime._d_ComparisonType, _0_CosTime._tc_ComparisonType)

# enum OverlapType
_0_CosTime.OTContainer = omniORB.EnumItem("OTContainer", 0)
_0_CosTime.OTContained = omniORB.EnumItem("OTContained", 1)
_0_CosTime.OTOverlap = omniORB.EnumItem("OTOverlap", 2)
_0_CosTime.OTNoOverlap = omniORB.EnumItem("OTNoOverlap", 3)
_0_CosTime.OverlapType = omniORB.Enum("IDL:omg.org/CosTime/OverlapType:1.0", (_0_CosTime.OTContainer, _0_CosTime.OTContained, _0_CosTime.OTOverlap, _0_CosTime.OTNoOverlap,))

_0_CosTime._d_OverlapType  = (omniORB.tcInternal.tv_enum, _0_CosTime.OverlapType._NP_RepositoryId, "OverlapType", _0_CosTime.OverlapType._items)
_0_CosTime._tc_OverlapType = omniORB.tcInternal.createTypeCode(_0_CosTime._d_OverlapType)
omniORB.registerType(_0_CosTime.OverlapType._NP_RepositoryId, _0_CosTime._d_OverlapType, _0_CosTime._tc_OverlapType)

# exception TimeUnavailable
_0_CosTime.TimeUnavailable = omniORB.newEmptyClass()
class TimeUnavailable (CORBA.UserException):
    _NP_RepositoryId = "IDL:omg.org/CosTime/TimeUnavailable:1.0"

    def __init__(self):
        CORBA.UserException.__init__(self)

_0_CosTime.TimeUnavailable = TimeUnavailable
_0_CosTime._d_TimeUnavailable  = (omniORB.tcInternal.tv_except, TimeUnavailable, TimeUnavailable._NP_RepositoryId, "TimeUnavailable")
_0_CosTime._tc_TimeUnavailable = omniORB.tcInternal.createTypeCode(_0_CosTime._d_TimeUnavailable)
omniORB.registerType(TimeUnavailable._NP_RepositoryId, _0_CosTime._d_TimeUnavailable, _0_CosTime._tc_TimeUnavailable)
del TimeUnavailable

# interface TIO;
_0_CosTime._d_TIO = (omniORB.tcInternal.tv_objref, "IDL:omg.org/CosTime/TIO:1.0", "TIO")
omniORB.typeMapping["IDL:omg.org/CosTime/TIO:1.0"] = _0_CosTime._d_TIO

# interface UTO
_0_CosTime._d_UTO = (omniORB.tcInternal.tv_objref, "IDL:omg.org/CosTime/UTO:1.0", "UTO")
omniORB.typeMapping["IDL:omg.org/CosTime/UTO:1.0"] = _0_CosTime._d_UTO
_0_CosTime.UTO = omniORB.newEmptyClass()
class UTO :
    _NP_RepositoryId = _0_CosTime._d_UTO[1]

    def __init__(self, *args, **kw):
        raise RuntimeError("Cannot construct objects of this type.")

    _nil = CORBA.Object._nil


_0_CosTime.UTO = UTO
_0_CosTime._tc_UTO = omniORB.tcInternal.createTypeCode(_0_CosTime._d_UTO)
omniORB.registerType(UTO._NP_RepositoryId, _0_CosTime._d_UTO, _0_CosTime._tc_UTO)

# UTO operations and attributes
UTO._d__get_time = ((),(omniORB.typeMapping["IDL:omg.org/TimeBase/TimeT:1.0"],),None)
UTO._d__get_inaccuracy = ((),(omniORB.typeMapping["IDL:omg.org/TimeBase/InaccuracyT:1.0"],),None)
UTO._d__get_tdf = ((),(omniORB.typeMapping["IDL:omg.org/TimeBase/TdfT:1.0"],),None)
UTO._d__get_utc_time = ((),(omniORB.typeMapping["IDL:omg.org/TimeBase/UtcT:1.0"],),None)
UTO._d_absolute_time = ((), (omniORB.typeMapping["IDL:omg.org/CosTime/UTO:1.0"], ), None)
UTO._d_compare_time = ((omniORB.typeMapping["IDL:omg.org/CosTime/ComparisonType:1.0"], omniORB.typeMapping["IDL:omg.org/CosTime/UTO:1.0"]), (omniORB.typeMapping["IDL:omg.org/CosTime/TimeComparison:1.0"], ), None)
UTO._d_time_to_interval = ((omniORB.typeMapping["IDL:omg.org/CosTime/UTO:1.0"], ), (omniORB.typeMapping["IDL:omg.org/CosTime/TIO:1.0"], ), None)
UTO._d_interval = ((), (omniORB.typeMapping["IDL:omg.org/CosTime/TIO:1.0"], ), None)

# UTO object reference
class _objref_UTO (CORBA.Object):
    _NP_RepositoryId = UTO._NP_RepositoryId

    def __init__(self):
        CORBA.Object.__init__(self)

    def _get_time(self, *args):
        return _omnipy.invoke(self, "_get_time", _0_CosTime.UTO._d__get_time, args)

    def _get_inaccuracy(self, *args):
        return _omnipy.invoke(self, "_get_inaccuracy", _0_CosTime.UTO._d__get_inaccuracy, args)

    def _get_tdf(self, *args):
        return _omnipy.invoke(self, "_get_tdf", _0_CosTime.UTO._d__get_tdf, args)

    def _get_utc_time(self, *args):
        return _omnipy.invoke(self, "_get_utc_time", _0_CosTime.UTO._d__get_utc_time, args)

    def absolute_time(self, *args):
        return _omnipy.invoke(self, "absolute_time", _0_CosTime.UTO._d_absolute_time, args)

    def compare_time(self, *args):
        return _omnipy.invoke(self, "compare_time", _0_CosTime.UTO._d_compare_time, args)

    def time_to_interval(self, *args):
        return _omnipy.invoke(self, "time_to_interval", _0_CosTime.UTO._d_time_to_interval, args)

    def interval(self, *args):
        return _omnipy.invoke(self, "interval", _0_CosTime.UTO._d_interval, args)

    __methods__ = ["_get_time", "_get_inaccuracy", "_get_tdf", "_get_utc_time", "absolute_time", "compare_time", "time_to_interval", "interval"] + CORBA.Object.__methods__

omniORB.registerObjref(UTO._NP_RepositoryId, _objref_UTO)
_0_CosTime._objref_UTO = _objref_UTO
del UTO, _objref_UTO

# UTO skeleton
__name__ = "CosTime__POA"
class UTO (PortableServer.Servant):
    _NP_RepositoryId = _0_CosTime.UTO._NP_RepositoryId


    _omni_op_d = {"_get_time": _0_CosTime.UTO._d__get_time, "_get_inaccuracy": _0_CosTime.UTO._d__get_inaccuracy, "_get_tdf": _0_CosTime.UTO._d__get_tdf, "_get_utc_time": _0_CosTime.UTO._d__get_utc_time, "absolute_time": _0_CosTime.UTO._d_absolute_time, "compare_time": _0_CosTime.UTO._d_compare_time, "time_to_interval": _0_CosTime.UTO._d_time_to_interval, "interval": _0_CosTime.UTO._d_interval}

UTO._omni_skeleton = UTO
_0_CosTime__POA.UTO = UTO
omniORB.registerSkeleton(UTO._NP_RepositoryId, UTO)
del UTO
__name__ = "CosTime"

# interface TIO
_0_CosTime._d_TIO = (omniORB.tcInternal.tv_objref, "IDL:omg.org/CosTime/TIO:1.0", "TIO")
omniORB.typeMapping["IDL:omg.org/CosTime/TIO:1.0"] = _0_CosTime._d_TIO
_0_CosTime.TIO = omniORB.newEmptyClass()
class TIO :
    _NP_RepositoryId = _0_CosTime._d_TIO[1]

    def __init__(self, *args, **kw):
        raise RuntimeError("Cannot construct objects of this type.")

    _nil = CORBA.Object._nil


_0_CosTime.TIO = TIO
_0_CosTime._tc_TIO = omniORB.tcInternal.createTypeCode(_0_CosTime._d_TIO)
omniORB.registerType(TIO._NP_RepositoryId, _0_CosTime._d_TIO, _0_CosTime._tc_TIO)

# TIO operations and attributes
TIO._d__get_time_interval = ((),(omniORB.typeMapping["IDL:omg.org/TimeBase/IntervalT:1.0"],),None)
TIO._d_spans = ((omniORB.typeMapping["IDL:omg.org/CosTime/UTO:1.0"], ), (omniORB.typeMapping["IDL:omg.org/CosTime/OverlapType:1.0"], omniORB.typeMapping["IDL:omg.org/CosTime/TIO:1.0"]), None)
TIO._d_overlaps = ((omniORB.typeMapping["IDL:omg.org/CosTime/TIO:1.0"], ), (omniORB.typeMapping["IDL:omg.org/CosTime/OverlapType:1.0"], omniORB.typeMapping["IDL:omg.org/CosTime/TIO:1.0"]), None)
TIO._d_time = ((), (omniORB.typeMapping["IDL:omg.org/CosTime/UTO:1.0"], ), None)

# TIO object reference
class _objref_TIO (CORBA.Object):
    _NP_RepositoryId = TIO._NP_RepositoryId

    def __init__(self):
        CORBA.Object.__init__(self)

    def _get_time_interval(self, *args):
        return _omnipy.invoke(self, "_get_time_interval", _0_CosTime.TIO._d__get_time_interval, args)

    def spans(self, *args):
        return _omnipy.invoke(self, "spans", _0_CosTime.TIO._d_spans, args)

    def overlaps(self, *args):
        return _omnipy.invoke(self, "overlaps", _0_CosTime.TIO._d_overlaps, args)

    def time(self, *args):
        return _omnipy.invoke(self, "time", _0_CosTime.TIO._d_time, args)

    __methods__ = ["_get_time_interval", "spans", "overlaps", "time"] + CORBA.Object.__methods__

omniORB.registerObjref(TIO._NP_RepositoryId, _objref_TIO)
_0_CosTime._objref_TIO = _objref_TIO
del TIO, _objref_TIO

# TIO skeleton
__name__ = "CosTime__POA"
class TIO (PortableServer.Servant):
    _NP_RepositoryId = _0_CosTime.TIO._NP_RepositoryId


    _omni_op_d = {"_get_time_interval": _0_CosTime.TIO._d__get_time_interval, "spans": _0_CosTime.TIO._d_spans, "overlaps": _0_CosTime.TIO._d_overlaps, "time": _0_CosTime.TIO._d_time}

TIO._omni_skeleton = TIO
_0_CosTime__POA.TIO = TIO
omniORB.registerSkeleton(TIO._NP_RepositoryId, TIO)
del TIO
__name__ = "CosTime"

# interface TimeService
_0_CosTime._d_TimeService = (omniORB.tcInternal.tv_objref, "IDL:omg.org/CosTime/TimeService:1.0", "TimeService")
omniORB.typeMapping["IDL:omg.org/CosTime/TimeService:1.0"] = _0_CosTime._d_TimeService
_0_CosTime.TimeService = omniORB.newEmptyClass()
class TimeService :
    _NP_RepositoryId = _0_CosTime._d_TimeService[1]

    def __init__(self, *args, **kw):
        raise RuntimeError("Cannot construct objects of this type.")

    _nil = CORBA.Object._nil


_0_CosTime.TimeService = TimeService
_0_CosTime._tc_TimeService = omniORB.tcInternal.createTypeCode(_0_CosTime._d_TimeService)
omniORB.registerType(TimeService._NP_RepositoryId, _0_CosTime._d_TimeService, _0_CosTime._tc_TimeService)

# TimeService operations and attributes
TimeService._d_universal_time = ((), (omniORB.typeMapping["IDL:omg.org/CosTime/UTO:1.0"], ), {_0_CosTime.TimeUnavailable._NP_RepositoryId: _0_CosTime._d_TimeUnavailable})
TimeService._d_secure_universal_time = ((), (omniORB.typeMapping["IDL:omg.org/CosTime/UTO:1.0"], ), {_0_CosTime.TimeUnavailable._NP_RepositoryId: _0_CosTime._d_TimeUnavailable})
TimeService._d_new_universal_time = ((omniORB.typeMapping["IDL:omg.org/TimeBase/TimeT:1.0"], omniORB.typeMapping["IDL:omg.org/TimeBase/InaccuracyT:1.0"], omniORB.typeMapping["IDL:omg.org/TimeBase/TdfT:1.0"]), (omniORB.typeMapping["IDL:omg.org/CosTime/UTO:1.0"], ), None)
TimeService._d_uto_from_utc = ((omniORB.typeMapping["IDL:omg.org/TimeBase/UtcT:1.0"], ), (omniORB.typeMapping["IDL:omg.org/CosTime/UTO:1.0"], ), None)
TimeService._d_new_interval = ((omniORB.typeMapping["IDL:omg.org/TimeBase/TimeT:1.0"], omniORB.typeMapping["IDL:omg.org/TimeBase/TimeT:1.0"]), (omniORB.typeMapping["IDL:omg.org/CosTime/TIO:1.0"], ), None)

# TimeService object reference
class _objref_TimeService (CORBA.Object):
    _NP_RepositoryId = TimeService._NP_RepositoryId

    def __init__(self):
        CORBA.Object.__init__(self)

    def universal_time(self, *args):
        return _omnipy.invoke(self, "universal_time", _0_CosTime.TimeService._d_universal_time, args)

    def secure_universal_time(self, *args):
        return _omnipy.invoke(self, "secure_universal_time", _0_CosTime.TimeService._d_secure_universal_time, args)

    def new_universal_time(self, *args):
        return _omnipy.invoke(self, "new_universal_time", _0_CosTime.TimeService._d_new_universal_time, args)

    def uto_from_utc(self, *args):
        return _omnipy.invoke(self, "uto_from_utc", _0_CosTime.TimeService._d_uto_from_utc, args)

    def new_interval(self, *args):
        return _omnipy.invoke(self, "new_interval", _0_CosTime.TimeService._d_new_interval, args)

    __methods__ = ["universal_time", "secure_universal_time", "new_universal_time", "uto_from_utc", "new_interval"] + CORBA.Object.__methods__

omniORB.registerObjref(TimeService._NP_RepositoryId, _objref_TimeService)
_0_CosTime._objref_TimeService = _objref_TimeService
del TimeService, _objref_TimeService

# TimeService skeleton
__name__ = "CosTime__POA"
class TimeService (PortableServer.Servant):
    _NP_RepositoryId = _0_CosTime.TimeService._NP_RepositoryId


    _omni_op_d = {"universal_time": _0_CosTime.TimeService._d_universal_time, "secure_universal_time": _0_CosTime.TimeService._d_secure_universal_time, "new_universal_time": _0_CosTime.TimeService._d_new_universal_time, "uto_from_utc": _0_CosTime.TimeService._d_uto_from_utc, "new_interval": _0_CosTime.TimeService._d_new_interval}

TimeService._omni_skeleton = TimeService
_0_CosTime__POA.TimeService = TimeService
omniORB.registerSkeleton(TimeService._NP_RepositoryId, TimeService)
del TimeService
__name__ = "CosTime"

#
# End of module "CosTime"
#
__name__ = "CosTime_idl"

_exported_modules = ( "CosTime", )

# The end.
