{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-kinesisanalytics-applicationoutput.html

module Stratosphere.Resources.KinesisAnalyticsApplicationOutput where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values
import Stratosphere.ResourceProperties.KinesisAnalyticsApplicationOutputOutput

-- | Full data type definition for KinesisAnalyticsApplicationOutput. See
-- 'kinesisAnalyticsApplicationOutput' for a more convenient constructor.
data KinesisAnalyticsApplicationOutput =
  KinesisAnalyticsApplicationOutput
  { _kinesisAnalyticsApplicationOutputApplicationName :: Val Text
  , _kinesisAnalyticsApplicationOutputOutput :: KinesisAnalyticsApplicationOutputOutput
  } deriving (Show, Eq)

instance ToJSON KinesisAnalyticsApplicationOutput where
  toJSON KinesisAnalyticsApplicationOutput{..} =
    object $
    catMaybes
    [ (Just . ("ApplicationName",) . toJSON) _kinesisAnalyticsApplicationOutputApplicationName
    , (Just . ("Output",) . toJSON) _kinesisAnalyticsApplicationOutputOutput
    ]

instance FromJSON KinesisAnalyticsApplicationOutput where
  parseJSON (Object obj) =
    KinesisAnalyticsApplicationOutput <$>
      (obj .: "ApplicationName") <*>
      (obj .: "Output")
  parseJSON _ = mempty

-- | Constructor for 'KinesisAnalyticsApplicationOutput' containing required
-- fields as arguments.
kinesisAnalyticsApplicationOutput
  :: Val Text -- ^ 'kaaoApplicationName'
  -> KinesisAnalyticsApplicationOutputOutput -- ^ 'kaaoOutput'
  -> KinesisAnalyticsApplicationOutput
kinesisAnalyticsApplicationOutput applicationNamearg outputarg =
  KinesisAnalyticsApplicationOutput
  { _kinesisAnalyticsApplicationOutputApplicationName = applicationNamearg
  , _kinesisAnalyticsApplicationOutputOutput = outputarg
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-kinesisanalytics-applicationoutput.html#cfn-kinesisanalytics-applicationoutput-applicationname
kaaoApplicationName :: Lens' KinesisAnalyticsApplicationOutput (Val Text)
kaaoApplicationName = lens _kinesisAnalyticsApplicationOutputApplicationName (\s a -> s { _kinesisAnalyticsApplicationOutputApplicationName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-kinesisanalytics-applicationoutput.html#cfn-kinesisanalytics-applicationoutput-output
kaaoOutput :: Lens' KinesisAnalyticsApplicationOutput KinesisAnalyticsApplicationOutputOutput
kaaoOutput = lens _kinesisAnalyticsApplicationOutputOutput (\s a -> s { _kinesisAnalyticsApplicationOutputOutput = a })
