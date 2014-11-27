<cffunction name="libphonenumberGetRegionCodeForNumber" returntype="string" output="false">
  <cfargument name="number" type="libphonenumber.PhoneNumber" required="true" />

  <!--- Check the validity of the given phone number --->
  <cfreturn arguments.number.getRegionCodeForNumber() />
</cffunction>