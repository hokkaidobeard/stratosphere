{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-elasticloadbalancingv2-targetgroup.html

module Stratosphere.Resources.ElasticLoadBalancingV2TargetGroup where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values
import Stratosphere.ResourceProperties.ElasticLoadBalancingV2TargetGroupMatcher
import Stratosphere.ResourceProperties.Tag
import Stratosphere.ResourceProperties.ElasticLoadBalancingV2TargetGroupTargetGroupAttribute
import Stratosphere.ResourceProperties.ElasticLoadBalancingV2TargetGroupTargetDescription

-- | Full data type definition for ElasticLoadBalancingV2TargetGroup. See
-- 'elasticLoadBalancingV2TargetGroup' for a more convenient constructor.
data ElasticLoadBalancingV2TargetGroup =
  ElasticLoadBalancingV2TargetGroup
  { _elasticLoadBalancingV2TargetGroupHealthCheckIntervalSeconds :: Maybe (Val Integer)
  , _elasticLoadBalancingV2TargetGroupHealthCheckPath :: Maybe (Val Text)
  , _elasticLoadBalancingV2TargetGroupHealthCheckPort :: Maybe (Val Text)
  , _elasticLoadBalancingV2TargetGroupHealthCheckProtocol :: Maybe (Val Text)
  , _elasticLoadBalancingV2TargetGroupHealthCheckTimeoutSeconds :: Maybe (Val Integer)
  , _elasticLoadBalancingV2TargetGroupHealthyThresholdCount :: Maybe (Val Integer)
  , _elasticLoadBalancingV2TargetGroupMatcher :: Maybe ElasticLoadBalancingV2TargetGroupMatcher
  , _elasticLoadBalancingV2TargetGroupName :: Maybe (Val Text)
  , _elasticLoadBalancingV2TargetGroupPort :: Val Integer
  , _elasticLoadBalancingV2TargetGroupProtocol :: Val Text
  , _elasticLoadBalancingV2TargetGroupTags :: Maybe [Tag]
  , _elasticLoadBalancingV2TargetGroupTargetGroupAttributes :: Maybe [ElasticLoadBalancingV2TargetGroupTargetGroupAttribute]
  , _elasticLoadBalancingV2TargetGroupTargets :: Maybe [ElasticLoadBalancingV2TargetGroupTargetDescription]
  , _elasticLoadBalancingV2TargetGroupUnhealthyThresholdCount :: Maybe (Val Integer)
  , _elasticLoadBalancingV2TargetGroupVpcId :: Val Text
  } deriving (Show, Eq)

instance ToJSON ElasticLoadBalancingV2TargetGroup where
  toJSON ElasticLoadBalancingV2TargetGroup{..} =
    object $
    catMaybes
    [ fmap (("HealthCheckIntervalSeconds",) . toJSON . fmap Integer') _elasticLoadBalancingV2TargetGroupHealthCheckIntervalSeconds
    , fmap (("HealthCheckPath",) . toJSON) _elasticLoadBalancingV2TargetGroupHealthCheckPath
    , fmap (("HealthCheckPort",) . toJSON) _elasticLoadBalancingV2TargetGroupHealthCheckPort
    , fmap (("HealthCheckProtocol",) . toJSON) _elasticLoadBalancingV2TargetGroupHealthCheckProtocol
    , fmap (("HealthCheckTimeoutSeconds",) . toJSON . fmap Integer') _elasticLoadBalancingV2TargetGroupHealthCheckTimeoutSeconds
    , fmap (("HealthyThresholdCount",) . toJSON . fmap Integer') _elasticLoadBalancingV2TargetGroupHealthyThresholdCount
    , fmap (("Matcher",) . toJSON) _elasticLoadBalancingV2TargetGroupMatcher
    , fmap (("Name",) . toJSON) _elasticLoadBalancingV2TargetGroupName
    , (Just . ("Port",) . toJSON . fmap Integer') _elasticLoadBalancingV2TargetGroupPort
    , (Just . ("Protocol",) . toJSON) _elasticLoadBalancingV2TargetGroupProtocol
    , fmap (("Tags",) . toJSON) _elasticLoadBalancingV2TargetGroupTags
    , fmap (("TargetGroupAttributes",) . toJSON) _elasticLoadBalancingV2TargetGroupTargetGroupAttributes
    , fmap (("Targets",) . toJSON) _elasticLoadBalancingV2TargetGroupTargets
    , fmap (("UnhealthyThresholdCount",) . toJSON . fmap Integer') _elasticLoadBalancingV2TargetGroupUnhealthyThresholdCount
    , (Just . ("VpcId",) . toJSON) _elasticLoadBalancingV2TargetGroupVpcId
    ]

instance FromJSON ElasticLoadBalancingV2TargetGroup where
  parseJSON (Object obj) =
    ElasticLoadBalancingV2TargetGroup <$>
      fmap (fmap (fmap unInteger')) (obj .:? "HealthCheckIntervalSeconds") <*>
      (obj .:? "HealthCheckPath") <*>
      (obj .:? "HealthCheckPort") <*>
      (obj .:? "HealthCheckProtocol") <*>
      fmap (fmap (fmap unInteger')) (obj .:? "HealthCheckTimeoutSeconds") <*>
      fmap (fmap (fmap unInteger')) (obj .:? "HealthyThresholdCount") <*>
      (obj .:? "Matcher") <*>
      (obj .:? "Name") <*>
      fmap (fmap unInteger') (obj .: "Port") <*>
      (obj .: "Protocol") <*>
      (obj .:? "Tags") <*>
      (obj .:? "TargetGroupAttributes") <*>
      (obj .:? "Targets") <*>
      fmap (fmap (fmap unInteger')) (obj .:? "UnhealthyThresholdCount") <*>
      (obj .: "VpcId")
  parseJSON _ = mempty

-- | Constructor for 'ElasticLoadBalancingV2TargetGroup' containing required
-- fields as arguments.
elasticLoadBalancingV2TargetGroup
  :: Val Integer -- ^ 'elbvtgPort'
  -> Val Text -- ^ 'elbvtgProtocol'
  -> Val Text -- ^ 'elbvtgVpcId'
  -> ElasticLoadBalancingV2TargetGroup
elasticLoadBalancingV2TargetGroup portarg protocolarg vpcIdarg =
  ElasticLoadBalancingV2TargetGroup
  { _elasticLoadBalancingV2TargetGroupHealthCheckIntervalSeconds = Nothing
  , _elasticLoadBalancingV2TargetGroupHealthCheckPath = Nothing
  , _elasticLoadBalancingV2TargetGroupHealthCheckPort = Nothing
  , _elasticLoadBalancingV2TargetGroupHealthCheckProtocol = Nothing
  , _elasticLoadBalancingV2TargetGroupHealthCheckTimeoutSeconds = Nothing
  , _elasticLoadBalancingV2TargetGroupHealthyThresholdCount = Nothing
  , _elasticLoadBalancingV2TargetGroupMatcher = Nothing
  , _elasticLoadBalancingV2TargetGroupName = Nothing
  , _elasticLoadBalancingV2TargetGroupPort = portarg
  , _elasticLoadBalancingV2TargetGroupProtocol = protocolarg
  , _elasticLoadBalancingV2TargetGroupTags = Nothing
  , _elasticLoadBalancingV2TargetGroupTargetGroupAttributes = Nothing
  , _elasticLoadBalancingV2TargetGroupTargets = Nothing
  , _elasticLoadBalancingV2TargetGroupUnhealthyThresholdCount = Nothing
  , _elasticLoadBalancingV2TargetGroupVpcId = vpcIdarg
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-elasticloadbalancingv2-targetgroup.html#cfn-elasticloadbalancingv2-targetgroup-healthcheckintervalseconds
elbvtgHealthCheckIntervalSeconds :: Lens' ElasticLoadBalancingV2TargetGroup (Maybe (Val Integer))
elbvtgHealthCheckIntervalSeconds = lens _elasticLoadBalancingV2TargetGroupHealthCheckIntervalSeconds (\s a -> s { _elasticLoadBalancingV2TargetGroupHealthCheckIntervalSeconds = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-elasticloadbalancingv2-targetgroup.html#cfn-elasticloadbalancingv2-targetgroup-healthcheckpath
elbvtgHealthCheckPath :: Lens' ElasticLoadBalancingV2TargetGroup (Maybe (Val Text))
elbvtgHealthCheckPath = lens _elasticLoadBalancingV2TargetGroupHealthCheckPath (\s a -> s { _elasticLoadBalancingV2TargetGroupHealthCheckPath = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-elasticloadbalancingv2-targetgroup.html#cfn-elasticloadbalancingv2-targetgroup-healthcheckport
elbvtgHealthCheckPort :: Lens' ElasticLoadBalancingV2TargetGroup (Maybe (Val Text))
elbvtgHealthCheckPort = lens _elasticLoadBalancingV2TargetGroupHealthCheckPort (\s a -> s { _elasticLoadBalancingV2TargetGroupHealthCheckPort = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-elasticloadbalancingv2-targetgroup.html#cfn-elasticloadbalancingv2-targetgroup-healthcheckprotocol
elbvtgHealthCheckProtocol :: Lens' ElasticLoadBalancingV2TargetGroup (Maybe (Val Text))
elbvtgHealthCheckProtocol = lens _elasticLoadBalancingV2TargetGroupHealthCheckProtocol (\s a -> s { _elasticLoadBalancingV2TargetGroupHealthCheckProtocol = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-elasticloadbalancingv2-targetgroup.html#cfn-elasticloadbalancingv2-targetgroup-healthchecktimeoutseconds
elbvtgHealthCheckTimeoutSeconds :: Lens' ElasticLoadBalancingV2TargetGroup (Maybe (Val Integer))
elbvtgHealthCheckTimeoutSeconds = lens _elasticLoadBalancingV2TargetGroupHealthCheckTimeoutSeconds (\s a -> s { _elasticLoadBalancingV2TargetGroupHealthCheckTimeoutSeconds = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-elasticloadbalancingv2-targetgroup.html#cfn-elasticloadbalancingv2-targetgroup-healthythresholdcount
elbvtgHealthyThresholdCount :: Lens' ElasticLoadBalancingV2TargetGroup (Maybe (Val Integer))
elbvtgHealthyThresholdCount = lens _elasticLoadBalancingV2TargetGroupHealthyThresholdCount (\s a -> s { _elasticLoadBalancingV2TargetGroupHealthyThresholdCount = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-elasticloadbalancingv2-targetgroup.html#cfn-elasticloadbalancingv2-targetgroup-matcher
elbvtgMatcher :: Lens' ElasticLoadBalancingV2TargetGroup (Maybe ElasticLoadBalancingV2TargetGroupMatcher)
elbvtgMatcher = lens _elasticLoadBalancingV2TargetGroupMatcher (\s a -> s { _elasticLoadBalancingV2TargetGroupMatcher = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-elasticloadbalancingv2-targetgroup.html#cfn-elasticloadbalancingv2-targetgroup-name
elbvtgName :: Lens' ElasticLoadBalancingV2TargetGroup (Maybe (Val Text))
elbvtgName = lens _elasticLoadBalancingV2TargetGroupName (\s a -> s { _elasticLoadBalancingV2TargetGroupName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-elasticloadbalancingv2-targetgroup.html#cfn-elasticloadbalancingv2-targetgroup-port
elbvtgPort :: Lens' ElasticLoadBalancingV2TargetGroup (Val Integer)
elbvtgPort = lens _elasticLoadBalancingV2TargetGroupPort (\s a -> s { _elasticLoadBalancingV2TargetGroupPort = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-elasticloadbalancingv2-targetgroup.html#cfn-elasticloadbalancingv2-targetgroup-protocol
elbvtgProtocol :: Lens' ElasticLoadBalancingV2TargetGroup (Val Text)
elbvtgProtocol = lens _elasticLoadBalancingV2TargetGroupProtocol (\s a -> s { _elasticLoadBalancingV2TargetGroupProtocol = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-elasticloadbalancingv2-targetgroup.html#cfn-elasticloadbalancingv2-targetgroup-tags
elbvtgTags :: Lens' ElasticLoadBalancingV2TargetGroup (Maybe [Tag])
elbvtgTags = lens _elasticLoadBalancingV2TargetGroupTags (\s a -> s { _elasticLoadBalancingV2TargetGroupTags = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-elasticloadbalancingv2-targetgroup.html#cfn-elasticloadbalancingv2-targetgroup-targetgroupattributes
elbvtgTargetGroupAttributes :: Lens' ElasticLoadBalancingV2TargetGroup (Maybe [ElasticLoadBalancingV2TargetGroupTargetGroupAttribute])
elbvtgTargetGroupAttributes = lens _elasticLoadBalancingV2TargetGroupTargetGroupAttributes (\s a -> s { _elasticLoadBalancingV2TargetGroupTargetGroupAttributes = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-elasticloadbalancingv2-targetgroup.html#cfn-elasticloadbalancingv2-targetgroup-targets
elbvtgTargets :: Lens' ElasticLoadBalancingV2TargetGroup (Maybe [ElasticLoadBalancingV2TargetGroupTargetDescription])
elbvtgTargets = lens _elasticLoadBalancingV2TargetGroupTargets (\s a -> s { _elasticLoadBalancingV2TargetGroupTargets = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-elasticloadbalancingv2-targetgroup.html#cfn-elasticloadbalancingv2-targetgroup-unhealthythresholdcount
elbvtgUnhealthyThresholdCount :: Lens' ElasticLoadBalancingV2TargetGroup (Maybe (Val Integer))
elbvtgUnhealthyThresholdCount = lens _elasticLoadBalancingV2TargetGroupUnhealthyThresholdCount (\s a -> s { _elasticLoadBalancingV2TargetGroupUnhealthyThresholdCount = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-elasticloadbalancingv2-targetgroup.html#cfn-elasticloadbalancingv2-targetgroup-vpcid
elbvtgVpcId :: Lens' ElasticLoadBalancingV2TargetGroup (Val Text)
elbvtgVpcId = lens _elasticLoadBalancingV2TargetGroupVpcId (\s a -> s { _elasticLoadBalancingV2TargetGroupVpcId = a })
