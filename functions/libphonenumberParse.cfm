<cffunction name="libphonenumberParse" returntype="libphonenumber.PhoneNumber" output="false">
  <cfargument name="numberToParse" type="string" required="true" />
  <cfargument name="defaultRegion" type="string" required="true" />

  <!--- Parse the given phone number --->
  <cfreturn createObject("component", "libphonenumber.PhoneNumber").parse(argumentCollection = arguments) />
</cffunction>