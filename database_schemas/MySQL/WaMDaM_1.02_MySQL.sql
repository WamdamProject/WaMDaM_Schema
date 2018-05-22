-- Adel Abdallah, PhD Candidate, Utah State University, 2018

-- This is a Data Definition Language (DDL) script that
-- generates a blank schema of the Water Management Data Model (WaMDaM)
-- for MySQL database

-- Generated by Adel Abdallah May, 2018 based on WaMDaM XML design named WaMDaM_DBWrench_Schema_1.02.xml generated by DbWrench V4.04 @ http://www.dbwrench.com/ 
-- WaMDaM All rights reserved. See BSD 3-Clause Licence @ https://github.com/WamdamProject/WaMDaM-software-ecosystem 

-- Open MySQL Workbench, Create a New SQL Tab for Executing queries
-- Simply copy all this script and paste into the new window of "create query"
-- Then click execute. The script should run successfully and create the 41 empty tables of WaMDaM

--------------------------------------------------------------------------------------------------
DROP SCHEMA IF EXISTS WaMDaM;

CREATE SCHEMA IF NOT EXISTS WaMDaM;

/***************************************************************************/
/******************************* CREATE CVS ********************************/
/***************************************************************************/
USE WaMDaM;

CREATE TABLE CV_AggregationStatistic (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_AttributeDataType (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_AttributeName (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Category VARCHAR (255)  NULL,
	Definition VARCHAR (5000)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_Categorical (
	Term VARCHAR (255)  NOT NULL PRIMARY KEY,
	Name VARCHAR (255)  NOT NULL,
	AttributeName VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_ElectronicFileFormat (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_ElevationDatum (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_InstanceName (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_MethodType (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_ObjectType (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_ObjectTypology (
	Name VARCHAR (50)  NOT NULL PRIMARY KEY,
	Term VARCHAR (50)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_SeasonName (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_SpatialReference (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (5000)  NULL
);

CREATE TABLE CV_Units (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NOT NULL,
	UnitSystem VARCHAR (255)  NULL,
	UnitAbbreviation char (50)  NOT NULL,
	SourceVocabularyURI VARCHAR (5000)  NULL,
	ConversionFactor FLOAT   NULL,
	ConversionRelation VARCHAR (255)  NULL
);

/***************************************************************************/
/**************************** CREATE DATAVALUES ****************************/
/***************************************************************************/
USE WaMDaM;

CREATE TABLE CategoricalValues (
	CategoricalValueID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	CategoricalValue VARCHAR (500)  NOT NULL,
	CategoricalValueCV VARCHAR (255)  NULL,
	ValuesMapperID INT   NOT NULL
);

CREATE TABLE ElectronicFiles (
	ElectronicFileID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ElectronicFileName VARCHAR (255)  NOT NULL,
	ElectronicFile BLOB   NOT NULL,
	ElectronicFileFormatCV VARCHAR (255)  NOT NULL,
	Description TEXT   NULL,
	ValuesMapperID INT   NOT NULL
);

CREATE TABLE FreeText (
	FreeTextID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	FreeTextValue VARCHAR (500)  NOT NULL,
	ValuesMapperID INT   NOT NULL
);

CREATE TABLE MultiAttributeSeries (
	MultiAttributeSeriesID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	MappingID_Attribute INT   NOT NULL,
	ValuesMapperID INT   NOT NULL
);

CREATE TABLE MultiAttributeSeriesValues (
	MultiAttributeSeriesValueID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	MultiAttributeSeriesID INT   NOT NULL,
	DataValue VARCHAR (255)  NOT NULL,
	ValueOrder INT   NOT NULL
);

CREATE TABLE NumericValues (
	NumericValueID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	NumericValue FLOAT   NOT NULL,
	ValuesMapperID INT   NOT NULL
);

CREATE TABLE SeasonalNumericValues (
	SeasonalNumericValueID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	SeasonName VARCHAR (255)  NOT NULL,
	SeasonDateFormate DATETIME   NULL,
	SeasonOrder INT   NOT NULL,
	SeasonNameCV VARCHAR (255)  NULL,
	SeasonNumericValue FLOAT   NOT NULL,
	ValuesMapperID INT   NOT NULL
);

CREATE TABLE TimeSeries (
	TimeSeriesID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	YearType VARCHAR (50)  NOT NULL,
	AggregationStatisticCV VARCHAR (255)  NOT NULL,
	AggregationInterval DOUBLE   NOT NULL,
	IntervalTimeUnitCV VARCHAR (255)  NOT NULL,
	BeginDateTime DATETIME   NULL,
	EndDateTime DATETIME   NULL,
	IsRegular TINYINT(1)   NULL,
	NoDataValue VARCHAR (50)  NULL,
	Description TEXT   NULL,
	ValuesMapperID INT   NOT NULL
);

CREATE TABLE TimeSeriesValues (
	TimeSeriesValueID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	TimeSeriesID INT   NOT NULL,
	DateTimeStamp DATETIME   NOT NULL,
	DataValue FLOAT   NOT NULL
);

CREATE TABLE ValuesMapper (
	ValuesMapperID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY
);

/***************************************************************************/
/***************************** CREATE METADATA *****************************/
/***************************************************************************/
USE WaMDaM;

CREATE TABLE Methods (
	MethodID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	MethodName VARCHAR (255)  NOT NULL,
	MethodWebpage VARCHAR (255)  NULL,
	MethodCitation VARCHAR (500)  NULL,
	MethodTypeCV VARCHAR (255)  NULL,
	PersonID INT   NOT NULL,
	Description TEXT   NULL
);

CREATE TABLE Organizations (
	OrganizationID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	OrganizationName VARCHAR (255)  NOT NULL,
	OrganizationType VARCHAR (255)  NULL,
	OrganizationWebpage VARCHAR (255)  NULL,
	Description TEXT   NULL
);

CREATE TABLE People (
	PersonID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	PersonName VARCHAR (255)  NOT NULL,
	Address VARCHAR (255)  NULL,
	Email VARCHAR (255)  NULL,
	Phone VARCHAR (50)  NULL,
	PersonWebpage VARCHAR (255)  NULL,
	Position VARCHAR (255)  NULL,
	OrganizationID INT   NOT NULL
);

CREATE TABLE Sources (
	SourceID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	SourceName VARCHAR (500)  NOT NULL,
	SourceWebpage VARCHAR (500)  NULL,
	SourceCitation VARCHAR (500)  NULL,
	PersonID INT   NOT NULL,
	Description TEXT   NULL
);

/***************************************************************************/
/***************************** CREATE NETSCEN ******************************/
/***************************************************************************/
USE WaMDaM;

CREATE TABLE Connections (
	ConnectivityID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	LinkInstanceID INT   NOT NULL,
	StartNodeInstanceID INT   NOT NULL,
	EndNodeInstanceID INT   NOT NULL
);

CREATE TABLE InstanceCategories (
	InstanceCategoryID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	InstanceCategory VARCHAR (255)  NOT NULL,
	CategoryDefinition TEXT   NULL
);

CREATE TABLE Instances (
	InstanceID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	InstanceName VARCHAR (255)  NOT NULL,
	InstanceNameCV VARCHAR (255)  NULL,
	Longitude_x FLOAT   NULL,
	Latitude_y FLOAT   NULL,
	Description TEXT   NULL,
	InstanceCategoryID INT   NULL
);

CREATE TABLE Mappings (
	MappingID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	AttributeID INT   NOT NULL,
	InstanceID INT   NOT NULL,
	SourceID INT   NOT NULL,
	MethodID INT   NOT NULL,
	ValuesMapperID INT   NULL,
	Verified VARCHAR (5)  NULL
);

CREATE TABLE MasterNetworks (
	MasterNetworkID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	MasterNetworkName VARCHAR (255)  NOT NULL,
	SpatialReferenceNameCV VARCHAR (255)  NOT NULL,
	VerticalDatumCV VARCHAR (255)  NOT NULL,
	Description TEXT   NULL
);

CREATE TABLE ScenarioMappings (
	ScenarioMappingID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ScenarioID INT   NOT NULL,
	MappingID INT   NOT NULL
);

CREATE TABLE Scenarios (
	ScenarioID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ScenarioName VARCHAR (255)  NOT NULL,
	ScenarioStartDate VARCHAR (255)  NULL,
	ScenarioEndDate DATETIME   NULL,
	TimeStepValue INT   NULL,
	TimeStepUnitCV VARCHAR (255)  NULL,
	MasterNetworkID INT   NOT NULL,
	Description TEXT   NULL
);

/***************************************************************************/
/************************** CREATE RESOURCESTRUCT **************************/
/***************************************************************************/
USE WaMDaM;

CREATE TABLE AttributeCategories (
	AttributeCategoryID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	AttributeCategoryName VARCHAR (255)  NOT NULL,
	CategoryDefinition TEXT   NULL
);

CREATE TABLE Attributes (
	AttributeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	AttributeName VARCHAR (255)  NOT NULL,
	AttributeNameCV VARCHAR (255)  NULL,
	ObjectTypeID INT   NOT NULL,
	UnitName VARCHAR (255)  NOT NULL,
	UnitNameCV VARCHAR (255)  NULL,
	AttributeDataTypeCV VARCHAR (255)  NOT NULL,
	AttributeCategoryID INT   NULL,
	ModelInputOrOutput char (50)  NULL,
	Description TEXT   NULL
);

CREATE TABLE ObjectCategories (
	ObjectCategoryID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ObjectCategoryName VARCHAR (255)  NOT NULL,
	CategoryDefinition TEXT   NULL
);

CREATE TABLE ObjectTypes (
	ObjectTypeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ObjectType VARCHAR (255)  NOT NULL,
	ObjectTypeCV VARCHAR (255)  NULL,
	ObjectTypologyCV VARCHAR (50)  NOT NULL,
	Layout TEXT   NULL,
	Description TEXT   NULL,
	ObjectCategoryID INT   NULL,
	ResourceTypeID INT   NOT NULL
);

CREATE TABLE ResourceTypes (
	ResourceTypeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ResourceType VARCHAR (255)  NOT NULL,
	ResourceTypeAcronym VARCHAR (255)  NOT NULL,
	MethodID INT   NOT NULL,
	Description TEXT   NULL
);

CREATE TABLE WaMDaMVersion (
	VersionNumber decimal (2)  NOT NULL PRIMARY KEY
);


ALTER TABLE CategoricalValues ADD CONSTRAINT fk_CategoricalValues_ValuesMapper
FOREIGN KEY (ValuesMapperID) REFERENCES ValuesMapper (ValuesMapperID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE CategoricalValues ADD CONSTRAINT fk_DescriptorValues_CV_DescriptorValues
FOREIGN KEY (CategoricalValueCV) REFERENCES CV_Categorical (Term)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ElectronicFiles ADD CONSTRAINT fk_ElectronicFiles_ValuesMapper
FOREIGN KEY (ValuesMapperID) REFERENCES ValuesMapper (ValuesMapperID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ElectronicFiles ADD CONSTRAINT fk_Files_CV_FileFormat
FOREIGN KEY (ElectronicFileFormatCV) REFERENCES CV_ElectronicFileFormat (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE FreeText ADD CONSTRAINT fk_FreeText_ValuesMapper
FOREIGN KEY (ValuesMapperID) REFERENCES ValuesMapper (ValuesMapperID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MultiAttributeSeries ADD CONSTRAINT fk_MultiAttributeSeries_Mappings
FOREIGN KEY (MappingID_Attribute) REFERENCES Mappings (MappingID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MultiAttributeSeries ADD CONSTRAINT fk_MultiAttributeSeries_ValuesMapper
FOREIGN KEY (ValuesMapperID) REFERENCES ValuesMapper (ValuesMapperID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MultiAttributeSeriesValues ADD CONSTRAINT fk_MultiAttributeSeriesValues_MultiAttributeSeries
FOREIGN KEY (MultiAttributeSeriesID) REFERENCES MultiAttributeSeries (MultiAttributeSeriesID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE NumericValues ADD CONSTRAINT fk_NumericValues_ValuesMapper
FOREIGN KEY (ValuesMapperID) REFERENCES ValuesMapper (ValuesMapperID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SeasonalNumericValues ADD CONSTRAINT fk_SeasonalNumericValues_CV_SeasonName
FOREIGN KEY (SeasonNameCV) REFERENCES CV_SeasonName (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SeasonalNumericValues ADD CONSTRAINT fk_SeasonalNumericValues_ValuesMapper
FOREIGN KEY (ValuesMapperID) REFERENCES ValuesMapper (ValuesMapperID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TimeSeries ADD CONSTRAINT fk_TimeSeries_CV_AggregationStatistic
FOREIGN KEY (AggregationStatisticCV) REFERENCES CV_AggregationStatistic (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TimeSeries ADD CONSTRAINT fk_TimeSeries_CV_Units
FOREIGN KEY (IntervalTimeUnitCV) REFERENCES CV_Units (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TimeSeries ADD CONSTRAINT fk_TimeSeries_ValuesMapper
FOREIGN KEY (ValuesMapperID) REFERENCES ValuesMapper (ValuesMapperID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TimeSeriesValues ADD CONSTRAINT fk_TimeSeriesValues_TimeSeries
FOREIGN KEY (TimeSeriesID) REFERENCES TimeSeries (TimeSeriesID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Methods ADD CONSTRAINT fk_Methods_CV_MethodType
FOREIGN KEY (MethodTypeCV) REFERENCES CV_MethodType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Methods ADD CONSTRAINT fk_Methods_People
FOREIGN KEY (PersonID) REFERENCES People (PersonID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE People ADD CONSTRAINT fk_People_Organizations
FOREIGN KEY (OrganizationID) REFERENCES Organizations (OrganizationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Sources ADD CONSTRAINT fk_Sources_People
FOREIGN KEY (PersonID) REFERENCES People (PersonID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Connections ADD CONSTRAINT fk_Connections_Instances
FOREIGN KEY (EndNodeInstanceID) REFERENCES Instances (InstanceID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Connections ADD CONSTRAINT fk_Connections_Instances_Link
FOREIGN KEY (LinkInstanceID) REFERENCES Instances (InstanceID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Connections ADD CONSTRAINT fk_Connections_Instances_startNode
FOREIGN KEY (StartNodeInstanceID) REFERENCES Instances (InstanceID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Instances ADD CONSTRAINT fk_Instances_CV_InstanceName
FOREIGN KEY (InstanceNameCV) REFERENCES CV_InstanceName (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Instances ADD CONSTRAINT fk_Instances_InstanceCategories
FOREIGN KEY (InstanceCategoryID) REFERENCES InstanceCategories (InstanceCategoryID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Mappings ADD CONSTRAINT fk_Mappings_Attributes
FOREIGN KEY (AttributeID) REFERENCES Attributes (AttributeID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Mappings ADD CONSTRAINT fk_Mappings_Instances
FOREIGN KEY (InstanceID) REFERENCES Instances (InstanceID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Mappings ADD CONSTRAINT fk_Mappings_Methods
FOREIGN KEY (MethodID) REFERENCES Methods (MethodID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Mappings ADD CONSTRAINT fk_Mappings_Sources
FOREIGN KEY (SourceID) REFERENCES Sources (SourceID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Mappings ADD CONSTRAINT fk_Mappings_ValuesMapper
FOREIGN KEY (ValuesMapperID) REFERENCES ValuesMapper (ValuesMapperID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MasterNetworks ADD CONSTRAINT fk_MasterNetworks_CV_SpatialReference
FOREIGN KEY (SpatialReferenceNameCV) REFERENCES CV_SpatialReference (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MasterNetworks ADD CONSTRAINT fk_MasterNetworks_CV_VerticalDatum
FOREIGN KEY (VerticalDatumCV) REFERENCES CV_ElevationDatum (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ScenarioMappings ADD CONSTRAINT fk_ScenarioMapping_Scenarios
FOREIGN KEY (ScenarioID) REFERENCES Scenarios (ScenarioID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ScenarioMappings ADD CONSTRAINT fk_ScenarioMappings_Mappings
FOREIGN KEY (MappingID) REFERENCES Mappings (MappingID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Scenarios ADD CONSTRAINT fk_Scenarios_CV_Units
FOREIGN KEY (TimeStepUnitCV) REFERENCES CV_Units (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Scenarios ADD CONSTRAINT fk_Scenarios_MasterNetworks
FOREIGN KEY (MasterNetworkID) REFERENCES MasterNetworks (MasterNetworkID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Attributes ADD CONSTRAINT fk_Attributes_CV_AttributeName
FOREIGN KEY (AttributeNameCV) REFERENCES CV_AttributeName (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Attributes ADD CONSTRAINT fk_Attributes_CV_AttributeType
FOREIGN KEY (AttributeDataTypeCV) REFERENCES CV_AttributeDataType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Attributes ADD CONSTRAINT fk_Attributes_CV_Units
FOREIGN KEY (UnitNameCV) REFERENCES CV_Units (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Attributes ADD CONSTRAINT fk_Attributes_ObjectTypes
FOREIGN KEY (ObjectTypeID) REFERENCES ObjectTypes (ObjectTypeID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Attributes ADD CONSTRAINT fk_ObjectAttributes_AttributeCategory
FOREIGN KEY (AttributeCategoryID) REFERENCES AttributeCategories (AttributeCategoryID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ObjectTypes ADD CONSTRAINT fk_ObjectTypes_CV_ObjectTopology
FOREIGN KEY (ObjectTypologyCV) REFERENCES CV_ObjectTypology (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ObjectTypes ADD CONSTRAINT fk_ObjectTypes_CV_ObjectTypes
FOREIGN KEY (ObjectTypeCV) REFERENCES CV_ObjectType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ObjectTypes ADD CONSTRAINT fk_ObjectTypes_Datasets
FOREIGN KEY (ResourceTypeID) REFERENCES ResourceTypes (ResourceTypeID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ObjectTypes ADD CONSTRAINT fk_ObjectTypes_ObjectCategory
FOREIGN KEY (ObjectCategoryID) REFERENCES ObjectCategories (ObjectCategoryID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ResourceTypes ADD CONSTRAINT fk_ResourceTypes_Methods
FOREIGN KEY (MethodID) REFERENCES Methods (MethodID)
ON UPDATE NO ACTION ON DELETE NO ACTION;