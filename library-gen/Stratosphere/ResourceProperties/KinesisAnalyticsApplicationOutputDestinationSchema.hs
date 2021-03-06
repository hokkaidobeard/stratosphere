{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisanalytics-applicationoutput-destinationschema.html

module Stratosphere.ResourceProperties.KinesisAnalyticsApplicationOutputDestinationSchema where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values


-- | Full data type definition for
-- KinesisAnalyticsApplicationOutputDestinationSchema. See
-- 'kinesisAnalyticsApplicationOutputDestinationSchema' for a more
-- convenient constructor.
data KinesisAnalyticsApplicationOutputDestinationSchema =
  KinesisAnalyticsApplicationOutputDestinationSchema
  { _kinesisAnalyticsApplicationOutputDestinationSchemaRecordFormatType :: Maybe (Val Text)
  } deriving (Show, Eq)

instance ToJSON KinesisAnalyticsApplicationOutputDestinationSchema where
  toJSON KinesisAnalyticsApplicationOutputDestinationSchema{..} =
    object $
    catMaybes
    [ fmap (("RecordFormatType",) . toJSON) _kinesisAnalyticsApplicationOutputDestinationSchemaRecordFormatType
    ]

instance FromJSON KinesisAnalyticsApplicationOutputDestinationSchema where
  parseJSON (Object obj) =
    KinesisAnalyticsApplicationOutputDestinationSchema <$>
      (obj .:? "RecordFormatType")
  parseJSON _ = mempty

-- | Constructor for 'KinesisAnalyticsApplicationOutputDestinationSchema'
-- containing required fields as arguments.
kinesisAnalyticsApplicationOutputDestinationSchema
  :: KinesisAnalyticsApplicationOutputDestinationSchema
kinesisAnalyticsApplicationOutputDestinationSchema  =
  KinesisAnalyticsApplicationOutputDestinationSchema
  { _kinesisAnalyticsApplicationOutputDestinationSchemaRecordFormatType = Nothing
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisanalytics-applicationoutput-destinationschema.html#cfn-kinesisanalytics-applicationoutput-destinationschema-recordformattype
kaaodsRecordFormatType :: Lens' KinesisAnalyticsApplicationOutputDestinationSchema (Maybe (Val Text))
kaaodsRecordFormatType = lens _kinesisAnalyticsApplicationOutputDestinationSchemaRecordFormatType (\s a -> s { _kinesisAnalyticsApplicationOutputDestinationSchemaRecordFormatType = a })
