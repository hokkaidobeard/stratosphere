{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-apigateway-restapi.html

module Stratosphere.Resources.ApiGatewayRestApi where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values
import Stratosphere.ResourceProperties.ApiGatewayRestApiS3Location

-- | Full data type definition for ApiGatewayRestApi. See 'apiGatewayRestApi'
-- for a more convenient constructor.
data ApiGatewayRestApi =
  ApiGatewayRestApi
  { _apiGatewayRestApiBinaryMediaTypes :: Maybe (ValList Text)
  , _apiGatewayRestApiBody :: Maybe Object
  , _apiGatewayRestApiBodyS3Location :: Maybe ApiGatewayRestApiS3Location
  , _apiGatewayRestApiCloneFrom :: Maybe (Val Text)
  , _apiGatewayRestApiDescription :: Maybe (Val Text)
  , _apiGatewayRestApiFailOnWarnings :: Maybe (Val Bool)
  , _apiGatewayRestApiMode :: Maybe (Val Text)
  , _apiGatewayRestApiName :: Maybe (Val Text)
  , _apiGatewayRestApiParameters :: Maybe Object
  } deriving (Show, Eq)

instance ToJSON ApiGatewayRestApi where
  toJSON ApiGatewayRestApi{..} =
    object $
    catMaybes
    [ fmap (("BinaryMediaTypes",) . toJSON) _apiGatewayRestApiBinaryMediaTypes
    , fmap (("Body",) . toJSON) _apiGatewayRestApiBody
    , fmap (("BodyS3Location",) . toJSON) _apiGatewayRestApiBodyS3Location
    , fmap (("CloneFrom",) . toJSON) _apiGatewayRestApiCloneFrom
    , fmap (("Description",) . toJSON) _apiGatewayRestApiDescription
    , fmap (("FailOnWarnings",) . toJSON . fmap Bool') _apiGatewayRestApiFailOnWarnings
    , fmap (("Mode",) . toJSON) _apiGatewayRestApiMode
    , fmap (("Name",) . toJSON) _apiGatewayRestApiName
    , fmap (("Parameters",) . toJSON) _apiGatewayRestApiParameters
    ]

instance FromJSON ApiGatewayRestApi where
  parseJSON (Object obj) =
    ApiGatewayRestApi <$>
      (obj .:? "BinaryMediaTypes") <*>
      (obj .:? "Body") <*>
      (obj .:? "BodyS3Location") <*>
      (obj .:? "CloneFrom") <*>
      (obj .:? "Description") <*>
      fmap (fmap (fmap unBool')) (obj .:? "FailOnWarnings") <*>
      (obj .:? "Mode") <*>
      (obj .:? "Name") <*>
      (obj .:? "Parameters")
  parseJSON _ = mempty

-- | Constructor for 'ApiGatewayRestApi' containing required fields as
-- arguments.
apiGatewayRestApi
  :: ApiGatewayRestApi
apiGatewayRestApi  =
  ApiGatewayRestApi
  { _apiGatewayRestApiBinaryMediaTypes = Nothing
  , _apiGatewayRestApiBody = Nothing
  , _apiGatewayRestApiBodyS3Location = Nothing
  , _apiGatewayRestApiCloneFrom = Nothing
  , _apiGatewayRestApiDescription = Nothing
  , _apiGatewayRestApiFailOnWarnings = Nothing
  , _apiGatewayRestApiMode = Nothing
  , _apiGatewayRestApiName = Nothing
  , _apiGatewayRestApiParameters = Nothing
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-apigateway-restapi.html#cfn-apigateway-restapi-binarymediatypes
agraBinaryMediaTypes :: Lens' ApiGatewayRestApi (Maybe (ValList Text))
agraBinaryMediaTypes = lens _apiGatewayRestApiBinaryMediaTypes (\s a -> s { _apiGatewayRestApiBinaryMediaTypes = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-apigateway-restapi.html#cfn-apigateway-restapi-body
agraBody :: Lens' ApiGatewayRestApi (Maybe Object)
agraBody = lens _apiGatewayRestApiBody (\s a -> s { _apiGatewayRestApiBody = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-apigateway-restapi.html#cfn-apigateway-restapi-bodys3location
agraBodyS3Location :: Lens' ApiGatewayRestApi (Maybe ApiGatewayRestApiS3Location)
agraBodyS3Location = lens _apiGatewayRestApiBodyS3Location (\s a -> s { _apiGatewayRestApiBodyS3Location = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-apigateway-restapi.html#cfn-apigateway-restapi-clonefrom
agraCloneFrom :: Lens' ApiGatewayRestApi (Maybe (Val Text))
agraCloneFrom = lens _apiGatewayRestApiCloneFrom (\s a -> s { _apiGatewayRestApiCloneFrom = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-apigateway-restapi.html#cfn-apigateway-restapi-description
agraDescription :: Lens' ApiGatewayRestApi (Maybe (Val Text))
agraDescription = lens _apiGatewayRestApiDescription (\s a -> s { _apiGatewayRestApiDescription = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-apigateway-restapi.html#cfn-apigateway-restapi-failonwarnings
agraFailOnWarnings :: Lens' ApiGatewayRestApi (Maybe (Val Bool))
agraFailOnWarnings = lens _apiGatewayRestApiFailOnWarnings (\s a -> s { _apiGatewayRestApiFailOnWarnings = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-apigateway-restapi.html#cfn-apigateway-restapi-mode
agraMode :: Lens' ApiGatewayRestApi (Maybe (Val Text))
agraMode = lens _apiGatewayRestApiMode (\s a -> s { _apiGatewayRestApiMode = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-apigateway-restapi.html#cfn-apigateway-restapi-name
agraName :: Lens' ApiGatewayRestApi (Maybe (Val Text))
agraName = lens _apiGatewayRestApiName (\s a -> s { _apiGatewayRestApiName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-apigateway-restapi.html#cfn-apigateway-restapi-parameters
agraParameters :: Lens' ApiGatewayRestApi (Maybe Object)
agraParameters = lens _apiGatewayRestApiParameters (\s a -> s { _apiGatewayRestApiParameters = a })
