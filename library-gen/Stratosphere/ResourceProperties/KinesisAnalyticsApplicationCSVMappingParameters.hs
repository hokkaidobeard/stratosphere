{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisanalytics-application-csvmappingparameters.html

module Stratosphere.ResourceProperties.KinesisAnalyticsApplicationCSVMappingParameters where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values


-- | Full data type definition for
-- KinesisAnalyticsApplicationCSVMappingParameters. See
-- 'kinesisAnalyticsApplicationCSVMappingParameters' for a more convenient
-- constructor.
data KinesisAnalyticsApplicationCSVMappingParameters =
  KinesisAnalyticsApplicationCSVMappingParameters
  { _kinesisAnalyticsApplicationCSVMappingParametersRecordColumnDelimiter :: Val Text
  , _kinesisAnalyticsApplicationCSVMappingParametersRecordRowDelimiter :: Val Text
  } deriving (Show, Eq)

instance ToJSON KinesisAnalyticsApplicationCSVMappingParameters where
  toJSON KinesisAnalyticsApplicationCSVMappingParameters{..} =
    object $
    catMaybes
    [ (Just . ("RecordColumnDelimiter",) . toJSON) _kinesisAnalyticsApplicationCSVMappingParametersRecordColumnDelimiter
    , (Just . ("RecordRowDelimiter",) . toJSON) _kinesisAnalyticsApplicationCSVMappingParametersRecordRowDelimiter
    ]

instance FromJSON KinesisAnalyticsApplicationCSVMappingParameters where
  parseJSON (Object obj) =
    KinesisAnalyticsApplicationCSVMappingParameters <$>
      (obj .: "RecordColumnDelimiter") <*>
      (obj .: "RecordRowDelimiter")
  parseJSON _ = mempty

-- | Constructor for 'KinesisAnalyticsApplicationCSVMappingParameters'
-- containing required fields as arguments.
kinesisAnalyticsApplicationCSVMappingParameters
  :: Val Text -- ^ 'kaacsvmpRecordColumnDelimiter'
  -> Val Text -- ^ 'kaacsvmpRecordRowDelimiter'
  -> KinesisAnalyticsApplicationCSVMappingParameters
kinesisAnalyticsApplicationCSVMappingParameters recordColumnDelimiterarg recordRowDelimiterarg =
  KinesisAnalyticsApplicationCSVMappingParameters
  { _kinesisAnalyticsApplicationCSVMappingParametersRecordColumnDelimiter = recordColumnDelimiterarg
  , _kinesisAnalyticsApplicationCSVMappingParametersRecordRowDelimiter = recordRowDelimiterarg
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisanalytics-application-csvmappingparameters.html#cfn-kinesisanalytics-application-csvmappingparameters-recordcolumndelimiter
kaacsvmpRecordColumnDelimiter :: Lens' KinesisAnalyticsApplicationCSVMappingParameters (Val Text)
kaacsvmpRecordColumnDelimiter = lens _kinesisAnalyticsApplicationCSVMappingParametersRecordColumnDelimiter (\s a -> s { _kinesisAnalyticsApplicationCSVMappingParametersRecordColumnDelimiter = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisanalytics-application-csvmappingparameters.html#cfn-kinesisanalytics-application-csvmappingparameters-recordrowdelimiter
kaacsvmpRecordRowDelimiter :: Lens' KinesisAnalyticsApplicationCSVMappingParameters (Val Text)
kaacsvmpRecordRowDelimiter = lens _kinesisAnalyticsApplicationCSVMappingParametersRecordRowDelimiter (\s a -> s { _kinesisAnalyticsApplicationCSVMappingParametersRecordRowDelimiter = a })
