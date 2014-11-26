<cffunction name="libphonenumberGetExampleNumber" returntype="libphonenumber.PhoneNumber" output="false">
  <cfargument name="regionCode" type="string" required="true" />

  <!--- Generate an example phone number for the given region --->
  <cfreturn createObject("component", "libphonenumber.PhoneNumber").getExampleNumber(arguments.regionCode) />
</cffunction>