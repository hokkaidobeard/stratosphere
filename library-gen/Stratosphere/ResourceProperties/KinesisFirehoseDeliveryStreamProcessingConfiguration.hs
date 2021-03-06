{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisfirehose-kinesisdeliverystream-processingconfiguration.html

module Stratosphere.ResourceProperties.KinesisFirehoseDeliveryStreamProcessingConfiguration where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values
import Stratosphere.ResourceProperties.KinesisFirehoseDeliveryStreamProcessor

-- | Full data type definition for
-- KinesisFirehoseDeliveryStreamProcessingConfiguration. See
-- 'kinesisFirehoseDeliveryStreamProcessingConfiguration' for a more
-- convenient constructor.
data KinesisFirehoseDeliveryStreamProcessingConfiguration =
  KinesisFirehoseDeliveryStreamProcessingConfiguration
  { _kinesisFirehoseDeliveryStreamProcessingConfigurationEnabled :: Val Bool
  , _kinesisFirehoseDeliveryStreamProcessingConfigurationProcessors :: [KinesisFirehoseDeliveryStreamProcessor]
  } deriving (Show, Eq)

instance ToJSON KinesisFirehoseDeliveryStreamProcessingConfiguration where
  toJSON KinesisFirehoseDeliveryStreamProcessingConfiguration{..} =
    object $
    catMaybes
    [ (Just . ("Enabled",) . toJSON . fmap Bool') _kinesisFirehoseDeliveryStreamProcessingConfigurationEnabled
    , (Just . ("Processors",) . toJSON) _kinesisFirehoseDeliveryStreamProcessingConfigurationProcessors
    ]

instance FromJSON KinesisFirehoseDeliveryStreamProcessingConfiguration where
  parseJSON (Object obj) =
    KinesisFirehoseDeliveryStreamProcessingConfiguration <$>
      fmap (fmap unBool') (obj .: "Enabled") <*>
      (obj .: "Processors")
  parseJSON _ = mempty

-- | Constructor for 'KinesisFirehoseDeliveryStreamProcessingConfiguration'
-- containing required fields as arguments.
kinesisFirehoseDeliveryStreamProcessingConfiguration
  :: Val Bool -- ^ 'kfdspcEnabled'
  -> [KinesisFirehoseDeliveryStreamProcessor] -- ^ 'kfdspcProcessors'
  -> KinesisFirehoseDeliveryStreamProcessingConfiguration
kinesisFirehoseDeliveryStreamProcessingConfiguration enabledarg processorsarg =
  KinesisFirehoseDeliveryStreamProcessingConfiguration
  { _kinesisFirehoseDeliveryStreamProcessingConfigurationEnabled = enabledarg
  , _kinesisFirehoseDeliveryStreamProcessingConfigurationProcessors = processorsarg
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisfirehose-kinesisdeliverystream-processingconfiguration.html#cfn-kinesisfirehose-kinesisdeliverystream-processingconfiguration-enabled
kfdspcEnabled :: Lens' KinesisFirehoseDeliveryStreamProcessingConfiguration (Val Bool)
kfdspcEnabled = lens _kinesisFirehoseDeliveryStreamProcessingConfigurationEnabled (\s a -> s { _kinesisFirehoseDeliveryStreamProcessingConfigurationEnabled = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisfirehose-kinesisdeliverystream-processingconfiguration.html#cfn-kinesisfirehose-kinesisdeliverystream-processingconfiguration-processors
kfdspcProcessors :: Lens' KinesisFirehoseDeliveryStreamProcessingConfiguration [KinesisFirehoseDeliveryStreamProcessor]
kfdspcProcessors = lens _kinesisFirehoseDeliveryStreamProcessingConfigurationProcessors (\s a -> s { _kinesisFirehoseDeliveryStreamProcessingConfigurationProcessors = a })
