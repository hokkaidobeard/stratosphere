{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-elasticmapreduce-cluster-scalingaction.html

module Stratosphere.ResourceProperties.EMRClusterScalingAction where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values
import Stratosphere.ResourceProperties.EMRClusterSimpleScalingPolicyConfiguration

-- | Full data type definition for EMRClusterScalingAction. See
-- 'emrClusterScalingAction' for a more convenient constructor.
data EMRClusterScalingAction =
  EMRClusterScalingAction
  { _eMRClusterScalingActionMarket :: Maybe (Val Text)
  , _eMRClusterScalingActionSimpleScalingPolicyConfiguration :: EMRClusterSimpleScalingPolicyConfiguration
  } deriving (Show, Eq)

instance ToJSON EMRClusterScalingAction where
  toJSON EMRClusterScalingAction{..} =
    object $
    catMaybes
    [ fmap (("Market",) . toJSON) _eMRClusterScalingActionMarket
    , (Just . ("SimpleScalingPolicyConfiguration",) . toJSON) _eMRClusterScalingActionSimpleScalingPolicyConfiguration
    ]

instance FromJSON EMRClusterScalingAction where
  parseJSON (Object obj) =
    EMRClusterScalingAction <$>
      (obj .:? "Market") <*>
      (obj .: "SimpleScalingPolicyConfiguration")
  parseJSON _ = mempty

-- | Constructor for 'EMRClusterScalingAction' containing required fields as
-- arguments.
emrClusterScalingAction
  :: EMRClusterSimpleScalingPolicyConfiguration -- ^ 'emrcsaSimpleScalingPolicyConfiguration'
  -> EMRClusterScalingAction
emrClusterScalingAction simpleScalingPolicyConfigurationarg =
  EMRClusterScalingAction
  { _eMRClusterScalingActionMarket = Nothing
  , _eMRClusterScalingActionSimpleScalingPolicyConfiguration = simpleScalingPolicyConfigurationarg
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-elasticmapreduce-cluster-scalingaction.html#cfn-elasticmapreduce-cluster-scalingaction-market
emrcsaMarket :: Lens' EMRClusterScalingAction (Maybe (Val Text))
emrcsaMarket = lens _eMRClusterScalingActionMarket (\s a -> s { _eMRClusterScalingActionMarket = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-elasticmapreduce-cluster-scalingaction.html#cfn-elasticmapreduce-cluster-scalingaction-simplescalingpolicyconfiguration
emrcsaSimpleScalingPolicyConfiguration :: Lens' EMRClusterScalingAction EMRClusterSimpleScalingPolicyConfiguration
emrcsaSimpleScalingPolicyConfiguration = lens _eMRClusterScalingActionSimpleScalingPolicyConfiguration (\s a -> s { _eMRClusterScalingActionSimpleScalingPolicyConfiguration = a })
