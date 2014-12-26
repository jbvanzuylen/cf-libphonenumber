<cffunction name="libphonenumberGetExampleNumberForType" returntype="libphonenumber.PhoneNumber" output="false">
  <cfargument name="regionCode" type="string" required="true" />
  <cfargument name="type" type="string" required="true" />

  <!--- Generate an example phone number for the given region and type --->
  <cfreturn createObject("component", "libphonenumber.PhoneNumber").getExampleNumberForType(argumentCollection = arguments) />
</cffunction>