{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-autoscaling-scalingpolicy-targettrackingconfiguration.html

module Stratosphere.ResourceProperties.AutoScalingScalingPolicyTargetTrackingConfiguration where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values
import Stratosphere.ResourceProperties.AutoScalingScalingPolicyCustomizedMetricSpecification
import Stratosphere.ResourceProperties.AutoScalingScalingPolicyPredefinedMetricSpecification

-- | Full data type definition for
-- AutoScalingScalingPolicyTargetTrackingConfiguration. See
-- 'autoScalingScalingPolicyTargetTrackingConfiguration' for a more
-- convenient constructor.
data AutoScalingScalingPolicyTargetTrackingConfiguration =
  AutoScalingScalingPolicyTargetTrackingConfiguration
  { _autoScalingScalingPolicyTargetTrackingConfigurationCustomizedMetricSpecification :: Maybe AutoScalingScalingPolicyCustomizedMetricSpecification
  , _autoScalingScalingPolicyTargetTrackingConfigurationDisableScaleIn :: Maybe (Val Bool)
  , _autoScalingScalingPolicyTargetTrackingConfigurationPredefinedMetricSpecification :: Maybe AutoScalingScalingPolicyPredefinedMetricSpecification
  , _autoScalingScalingPolicyTargetTrackingConfigurationTargetValue :: Val Double
  } deriving (Show, Eq)

instance ToJSON AutoScalingScalingPolicyTargetTrackingConfiguration where
  toJSON AutoScalingScalingPolicyTargetTrackingConfiguration{..} =
    object $
    catMaybes
    [ fmap (("CustomizedMetricSpecification",) . toJSON) _autoScalingScalingPolicyTargetTrackingConfigurationCustomizedMetricSpecification
    , fmap (("DisableScaleIn",) . toJSON . fmap Bool') _autoScalingScalingPolicyTargetTrackingConfigurationDisableScaleIn
    , fmap (("PredefinedMetricSpecification",) . toJSON) _autoScalingScalingPolicyTargetTrackingConfigurationPredefinedMetricSpecification
    , (Just . ("TargetValue",) . toJSON . fmap Double') _autoScalingScalingPolicyTargetTrackingConfigurationTargetValue
    ]

instance FromJSON AutoScalingScalingPolicyTargetTrackingConfiguration where
  parseJSON (Object obj) =
    AutoScalingScalingPolicyTargetTrackingConfiguration <$>
      (obj .:? "CustomizedMetricSpecification") <*>
      fmap (fmap (fmap unBool')) (obj .:? "DisableScaleIn") <*>
      (obj .:? "PredefinedMetricSpecification") <*>
      fmap (fmap unDouble') (obj .: "TargetValue")
  parseJSON _ = mempty

-- | Constructor for 'AutoScalingScalingPolicyTargetTrackingConfiguration'
-- containing required fields as arguments.
autoScalingScalingPolicyTargetTrackingConfiguration
  :: Val Double -- ^ 'asspttcTargetValue'
  -> AutoScalingScalingPolicyTargetTrackingConfiguration
autoScalingScalingPolicyTargetTrackingConfiguration targetValuearg =
  AutoScalingScalingPolicyTargetTrackingConfiguration
  { _autoScalingScalingPolicyTargetTrackingConfigurationCustomizedMetricSpecification = Nothing
  , _autoScalingScalingPolicyTargetTrackingConfigurationDisableScaleIn = Nothing
  , _autoScalingScalingPolicyTargetTrackingConfigurationPredefinedMetricSpecification = Nothing
  , _autoScalingScalingPolicyTargetTrackingConfigurationTargetValue = targetValuearg
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-autoscaling-scalingpolicy-targettrackingconfiguration.html#cfn-autoscaling-scalingpolicy-targettrackingconfiguration-customizedmetricspecification
asspttcCustomizedMetricSpecification :: Lens' AutoScalingScalingPolicyTargetTrackingConfiguration (Maybe AutoScalingScalingPolicyCustomizedMetricSpecification)
asspttcCustomizedMetricSpecification = lens _autoScalingScalingPolicyTargetTrackingConfigurationCustomizedMetricSpecification (\s a -> s { _autoScalingScalingPolicyTargetTrackingConfigurationCustomizedMetricSpecification = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-autoscaling-scalingpolicy-targettrackingconfiguration.html#cfn-autoscaling-scalingpolicy-targettrackingconfiguration-disablescalein
asspttcDisableScaleIn :: Lens' AutoScalingScalingPolicyTargetTrackingConfiguration (Maybe (Val Bool))
asspttcDisableScaleIn = lens _autoScalingScalingPolicyTargetTrackingConfigurationDisableScaleIn (\s a -> s { _autoScalingScalingPolicyTargetTrackingConfigurationDisableScaleIn = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-autoscaling-scalingpolicy-targettrackingconfiguration.html#cfn-autoscaling-scalingpolicy-targettrackingconfiguration-predefinedmetricspecification
asspttcPredefinedMetricSpecification :: Lens' AutoScalingScalingPolicyTargetTrackingConfiguration (Maybe AutoScalingScalingPolicyPredefinedMetricSpecification)
asspttcPredefinedMetricSpecification = lens _autoScalingScalingPolicyTargetTrackingConfigurationPredefinedMetricSpecification (\s a -> s { _autoScalingScalingPolicyTargetTrackingConfigurationPredefinedMetricSpecification = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-autoscaling-scalingpolicy-targettrackingconfiguration.html#cfn-autoscaling-scalingpolicy-targettrackingconfiguration-targetvalue
asspttcTargetValue :: Lens' AutoScalingScalingPolicyTargetTrackingConfiguration (Val Double)
asspttcTargetValue = lens _autoScalingScalingPolicyTargetTrackingConfigurationTargetValue (\s a -> s { _autoScalingScalingPolicyTargetTrackingConfigurationTargetValue = a })
