#' createEntity - Create a sample lot.
#'
#' \code{createSampleLot} Creates a lot of a sample.
#' @param coreApi coreApi object with valid jsessionid
#' @param entityType entity type to get as character string
#' @param sampleBarcode parent sample barcode
#' @param attributeValues atributes as a list of key-vlaues pairs
#' @param locationId location ID for inital location as character string
#' @param projectIds project comma seperated list of project IDs as character string
#' @param barcode User provided barcode as a character string
#' @param associations association as a list of dataframes (see details)
#' @param useVerbose Use verbose communitcaion for debuggins
#' @export
#' @return RETURN returns a list $entity contains entity information, $response contains the entire http response
#' @examples
#'\dontrun{
#' api<-CoreAPI("PATH TO JSON FILE")
#' login<- CoreAPI::authBasic(api)
#' item<-createSampleLot(login$coreApi,"Sample_Lot_Name","sample_barcode"
#' logOut(login$coreApi )
#' }
#'@author Craig Parman
#'@description \code{createSampleLot} Creates a new sample lot using the parent sample barcode




createSampleLot<-function (coreApi,entityType,sampleBarcode,attributeValues=NULL,
                        locationId=NULL,projectIds=NULL,barcode=NULL,associations=NULL,useVerbose=FALSE)

{


  sdkCmd<-jsonlite::unbox("create")
  data<-list(entityTypeName= jsonlite::unbox(entityType))

  if(!is.null(attributeValues))
  {

    values<-list()


    for(i in 1:length(attributeValues))
      {
        values[[names(attributeValues)[i]]] <- list(stringData= jsonlite::unbox(attributeValues[[i]]))
      }

    data[["values"]]<-values
  }




  data[["sampleRef"]] <- list(barcode = jsonlite::unbox(sampleBarcode))


 if(!is.null(locationId))
  {
  data[["locationId"]]<- locationId
  }


 if(!is.null(projectIds))
 {
   data[["projectIds"]]<- projectIds
 }

 if(!is.null(barcode))
 {
   data[["barcode"]]<- barcode
 }





 if(!is.null(associations))
 {
   data[["associations"]]<- associations
 }




  responseOptions<-c("CONTEXT_GET","MESSAGE_LEVEL_WARN")
  logicOptions<-jsonlite::unbox("EXECUTE_TRIGGERS")
  typeParam <- jsonlite::unbox(entityType)








 request<-list(request=list(sdkCmd=sdkCmd,data=data,typeParam =typeParam,
                             responseOptions=responseOptions,
                             logicOptions=logicOptions))






  sdk_url<-paste(coreApi$coreUrl,"/sdk",";jsessionid=",coreApi$jessionid,sep="")


  response<-httr::POST(sdk_url,body = request, encode="json",
                       httr::verbose(data_out = useVerbose, data_in = useVerbose, info = useVerbose, ssl = useVerbose))


  list(entity=httr::content(response)$response$data,response=response)

}

