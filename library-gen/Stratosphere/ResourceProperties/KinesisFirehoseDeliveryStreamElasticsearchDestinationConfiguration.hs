{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisfirehose-kinesisdeliverystream-elasticsearchdestinationconfiguration.html

module Stratosphere.ResourceProperties.KinesisFirehoseDeliveryStreamElasticsearchDestinationConfiguration where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values
import Stratosphere.Types
import Stratosphere.ResourceProperties.KinesisFirehoseDeliveryStreamElasticsearchBufferingHints
import Stratosphere.ResourceProperties.KinesisFirehoseDeliveryStreamCloudWatchLoggingOptions
import Stratosphere.ResourceProperties.KinesisFirehoseDeliveryStreamProcessingConfiguration
import Stratosphere.ResourceProperties.KinesisFirehoseDeliveryStreamElasticsearchRetryOptions
import Stratosphere.ResourceProperties.KinesisFirehoseDeliveryStreamS3DestinationConfiguration

-- | Full data type definition for
-- KinesisFirehoseDeliveryStreamElasticsearchDestinationConfiguration. See
-- 'kinesisFirehoseDeliveryStreamElasticsearchDestinationConfiguration' for
-- a more convenient constructor.
data KinesisFirehoseDeliveryStreamElasticsearchDestinationConfiguration =
  KinesisFirehoseDeliveryStreamElasticsearchDestinationConfiguration
  { _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationBufferingHints :: KinesisFirehoseDeliveryStreamElasticsearchBufferingHints
  , _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationCloudWatchLoggingOptions :: Maybe KinesisFirehoseDeliveryStreamCloudWatchLoggingOptions
  , _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationDomainARN :: Val Text
  , _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationIndexName :: Val Text
  , _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationIndexRotationPeriod :: Val Text
  , _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationProcessingConfiguration :: Maybe KinesisFirehoseDeliveryStreamProcessingConfiguration
  , _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationRetryOptions :: KinesisFirehoseDeliveryStreamElasticsearchRetryOptions
  , _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationRoleARN :: Val Text
  , _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationS3BackupMode :: Val KinesisFirehoseElasticsearchS3BackupMode
  , _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationS3Configuration :: KinesisFirehoseDeliveryStreamS3DestinationConfiguration
  , _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationTypeName :: Val Text
  } deriving (Show, Eq)

instance ToJSON KinesisFirehoseDeliveryStreamElasticsearchDestinationConfiguration where
  toJSON KinesisFirehoseDeliveryStreamElasticsearchDestinationConfiguration{..} =
    object $
    catMaybes
    [ (Just . ("BufferingHints",) . toJSON) _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationBufferingHints
    , fmap (("CloudWatchLoggingOptions",) . toJSON) _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationCloudWatchLoggingOptions
    , (Just . ("DomainARN",) . toJSON) _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationDomainARN
    , (Just . ("IndexName",) . toJSON) _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationIndexName
    , (Just . ("IndexRotationPeriod",) . toJSON) _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationIndexRotationPeriod
    , fmap (("ProcessingConfiguration",) . toJSON) _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationProcessingConfiguration
    , (Just . ("RetryOptions",) . toJSON) _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationRetryOptions
    , (Just . ("RoleARN",) . toJSON) _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationRoleARN
    , (Just . ("S3BackupMode",) . toJSON) _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationS3BackupMode
    , (Just . ("S3Configuration",) . toJSON) _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationS3Configuration
    , (Just . ("TypeName",) . toJSON) _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationTypeName
    ]

instance FromJSON KinesisFirehoseDeliveryStreamElasticsearchDestinationConfiguration where
  parseJSON (Object obj) =
    KinesisFirehoseDeliveryStreamElasticsearchDestinationConfiguration <$>
      (obj .: "BufferingHints") <*>
      (obj .:? "CloudWatchLoggingOptions") <*>
      (obj .: "DomainARN") <*>
      (obj .: "IndexName") <*>
      (obj .: "IndexRotationPeriod") <*>
      (obj .:? "ProcessingConfiguration") <*>
      (obj .: "RetryOptions") <*>
      (obj .: "RoleARN") <*>
      (obj .: "S3BackupMode") <*>
      (obj .: "S3Configuration") <*>
      (obj .: "TypeName")
  parseJSON _ = mempty

-- | Constructor for
-- 'KinesisFirehoseDeliveryStreamElasticsearchDestinationConfiguration'
-- containing required fields as arguments.
kinesisFirehoseDeliveryStreamElasticsearchDestinationConfiguration
  :: KinesisFirehoseDeliveryStreamElasticsearchBufferingHints -- ^ 'kfdsedcBufferingHints'
  -> Val Text -- ^ 'kfdsedcDomainARN'
  -> Val Text -- ^ 'kfdsedcIndexName'
  -> Val Text -- ^ 'kfdsedcIndexRotationPeriod'
  -> KinesisFirehoseDeliveryStreamElasticsearchRetryOptions -- ^ 'kfdsedcRetryOptions'
  -> Val Text -- ^ 'kfdsedcRoleARN'
  -> Val KinesisFirehoseElasticsearchS3BackupMode -- ^ 'kfdsedcS3BackupMode'
  -> KinesisFirehoseDeliveryStreamS3DestinationConfiguration -- ^ 'kfdsedcS3Configuration'
  -> Val Text -- ^ 'kfdsedcTypeName'
  -> KinesisFirehoseDeliveryStreamElasticsearchDestinationConfiguration
kinesisFirehoseDeliveryStreamElasticsearchDestinationConfiguration bufferingHintsarg domainARNarg indexNamearg indexRotationPeriodarg retryOptionsarg roleARNarg s3BackupModearg s3Configurationarg typeNamearg =
  KinesisFirehoseDeliveryStreamElasticsearchDestinationConfiguration
  { _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationBufferingHints = bufferingHintsarg
  , _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationCloudWatchLoggingOptions = Nothing
  , _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationDomainARN = domainARNarg
  , _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationIndexName = indexNamearg
  , _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationIndexRotationPeriod = indexRotationPeriodarg
  , _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationProcessingConfiguration = Nothing
  , _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationRetryOptions = retryOptionsarg
  , _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationRoleARN = roleARNarg
  , _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationS3BackupMode = s3BackupModearg
  , _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationS3Configuration = s3Configurationarg
  , _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationTypeName = typeNamearg
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisfirehose-kinesisdeliverystream-elasticsearchdestinationconfiguration.html#cfn-kinesisfirehose-kinesisdeliverystream-elasticsearchdestinationconfiguration-bufferinghints
kfdsedcBufferingHints :: Lens' KinesisFirehoseDeliveryStreamElasticsearchDestinationConfiguration KinesisFirehoseDeliveryStreamElasticsearchBufferingHints
kfdsedcBufferingHints = lens _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationBufferingHints (\s a -> s { _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationBufferingHints = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisfirehose-kinesisdeliverystream-elasticsearchdestinationconfiguration.html#cfn-kinesisfirehose-kinesisdeliverystream-elasticsearchdestinationconfiguration-cloudwatchloggingoptions
kfdsedcCloudWatchLoggingOptions :: Lens' KinesisFirehoseDeliveryStreamElasticsearchDestinationConfiguration (Maybe KinesisFirehoseDeliveryStreamCloudWatchLoggingOptions)
kfdsedcCloudWatchLoggingOptions = lens _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationCloudWatchLoggingOptions (\s a -> s { _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationCloudWatchLoggingOptions = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisfirehose-kinesisdeliverystream-elasticsearchdestinationconfiguration.html#cfn-kinesisfirehose-kinesisdeliverystream-elasticsearchdestinationconfiguration-domainarn
kfdsedcDomainARN :: Lens' KinesisFirehoseDeliveryStreamElasticsearchDestinationConfiguration (Val Text)
kfdsedcDomainARN = lens _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationDomainARN (\s a -> s { _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationDomainARN = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisfirehose-kinesisdeliverystream-elasticsearchdestinationconfiguration.html#cfn-kinesisfirehose-kinesisdeliverystream-elasticsearchdestinationconfiguration-indexname
kfdsedcIndexName :: Lens' KinesisFirehoseDeliveryStreamElasticsearchDestinationConfiguration (Val Text)
kfdsedcIndexName = lens _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationIndexName (\s a -> s { _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationIndexName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisfirehose-kinesisdeliverystream-elasticsearchdestinationconfiguration.html#cfn-kinesisfirehose-kinesisdeliverystream-elasticsearchdestinationconfiguration-indexrotationperiod
kfdsedcIndexRotationPeriod :: Lens' KinesisFirehoseDeliveryStreamElasticsearchDestinationConfiguration (Val Text)
kfdsedcIndexRotationPeriod = lens _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationIndexRotationPeriod (\s a -> s { _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationIndexRotationPeriod = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisfirehose-kinesisdeliverystream-elasticsearchdestinationconfiguration.html#cfn-kinesisfirehose-kinesisdeliverystream-processingconfiguration
kfdsedcProcessingConfiguration :: Lens' KinesisFirehoseDeliveryStreamElasticsearchDestinationConfiguration (Maybe KinesisFirehoseDeliveryStreamProcessingConfiguration)
kfdsedcProcessingConfiguration = lens _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationProcessingConfiguration (\s a -> s { _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationProcessingConfiguration = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisfirehose-kinesisdeliverystream-elasticsearchdestinationconfiguration.html#cfn-kinesisfirehose-kinesisdeliverystream-elasticsearchdestinationconfiguration-retryoptions
kfdsedcRetryOptions :: Lens' KinesisFirehoseDeliveryStreamElasticsearchDestinationConfiguration KinesisFirehoseDeliveryStreamElasticsearchRetryOptions
kfdsedcRetryOptions = lens _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationRetryOptions (\s a -> s { _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationRetryOptions = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisfirehose-kinesisdeliverystream-elasticsearchdestinationconfiguration.html#cfn-kinesisfirehose-kinesisdeliverystream-elasticsearchdestinationconfiguration-rolearn
kfdsedcRoleARN :: Lens' KinesisFirehoseDeliveryStreamElasticsearchDestinationConfiguration (Val Text)
kfdsedcRoleARN = lens _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationRoleARN (\s a -> s { _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationRoleARN = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisfirehose-kinesisdeliverystream-elasticsearchdestinationconfiguration.html#cfn-kinesisfirehose-kinesisdeliverystream-elasticsearchdestinationconfiguration-s3backupmode
kfdsedcS3BackupMode :: Lens' KinesisFirehoseDeliveryStreamElasticsearchDestinationConfiguration (Val KinesisFirehoseElasticsearchS3BackupMode)
kfdsedcS3BackupMode = lens _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationS3BackupMode (\s a -> s { _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationS3BackupMode = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisfirehose-kinesisdeliverystream-elasticsearchdestinationconfiguration.html#cfn-kinesisfirehose-kinesisdeliverystream-elasticsearchdestinationconfiguration-s3configuration
kfdsedcS3Configuration :: Lens' KinesisFirehoseDeliveryStreamElasticsearchDestinationConfiguration KinesisFirehoseDeliveryStreamS3DestinationConfiguration
kfdsedcS3Configuration = lens _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationS3Configuration (\s a -> s { _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationS3Configuration = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-kinesisfirehose-kinesisdeliverystream-elasticsearchdestinationconfiguration.html#cfn-kinesisfirehose-kinesisdeliverystream-elasticsearchdestinationconfiguration-typename
kfdsedcTypeName :: Lens' KinesisFirehoseDeliveryStreamElasticsearchDestinationConfiguration (Val Text)
kfdsedcTypeName = lens _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationTypeName (\s a -> s { _kinesisFirehoseDeliveryStreamElasticsearchDestinationConfigurationTypeName = a })
