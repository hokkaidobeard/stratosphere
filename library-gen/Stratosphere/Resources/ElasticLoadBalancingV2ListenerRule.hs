{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-elasticloadbalancingv2-listenerrule.html

module Stratosphere.Resources.ElasticLoadBalancingV2ListenerRule where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values
import Stratosphere.ResourceProperties.ElasticLoadBalancingV2ListenerRuleAction
import Stratosphere.ResourceProperties.ElasticLoadBalancingV2ListenerRuleRuleCondition

-- | Full data type definition for ElasticLoadBalancingV2ListenerRule. See
-- 'elasticLoadBalancingV2ListenerRule' for a more convenient constructor.
data ElasticLoadBalancingV2ListenerRule =
  ElasticLoadBalancingV2ListenerRule
  { _elasticLoadBalancingV2ListenerRuleActions :: [ElasticLoadBalancingV2ListenerRuleAction]
  , _elasticLoadBalancingV2ListenerRuleConditions :: [ElasticLoadBalancingV2ListenerRuleRuleCondition]
  , _elasticLoadBalancingV2ListenerRuleListenerArn :: Val Text
  , _elasticLoadBalancingV2ListenerRulePriority :: Val Integer
  } deriving (Show, Eq)

instance ToJSON ElasticLoadBalancingV2ListenerRule where
  toJSON ElasticLoadBalancingV2ListenerRule{..} =
    object $
    catMaybes
    [ (Just . ("Actions",) . toJSON) _elasticLoadBalancingV2ListenerRuleActions
    , (Just . ("Conditions",) . toJSON) _elasticLoadBalancingV2ListenerRuleConditions
    , (Just . ("ListenerArn",) . toJSON) _elasticLoadBalancingV2ListenerRuleListenerArn
    , (Just . ("Priority",) . toJSON . fmap Integer') _elasticLoadBalancingV2ListenerRulePriority
    ]

instance FromJSON ElasticLoadBalancingV2ListenerRule where
  parseJSON (Object obj) =
    ElasticLoadBalancingV2ListenerRule <$>
      (obj .: "Actions") <*>
      (obj .: "Conditions") <*>
      (obj .: "ListenerArn") <*>
      fmap (fmap unInteger') (obj .: "Priority")
  parseJSON _ = mempty

-- | Constructor for 'ElasticLoadBalancingV2ListenerRule' containing required
-- fields as arguments.
elasticLoadBalancingV2ListenerRule
  :: [ElasticLoadBalancingV2ListenerRuleAction] -- ^ 'elbvlrActions'
  -> [ElasticLoadBalancingV2ListenerRuleRuleCondition] -- ^ 'elbvlrConditions'
  -> Val Text -- ^ 'elbvlrListenerArn'
  -> Val Integer -- ^ 'elbvlrPriority'
  -> ElasticLoadBalancingV2ListenerRule
elasticLoadBalancingV2ListenerRule actionsarg conditionsarg listenerArnarg priorityarg =
  ElasticLoadBalancingV2ListenerRule
  { _elasticLoadBalancingV2ListenerRuleActions = actionsarg
  , _elasticLoadBalancingV2ListenerRuleConditions = conditionsarg
  , _elasticLoadBalancingV2ListenerRuleListenerArn = listenerArnarg
  , _elasticLoadBalancingV2ListenerRulePriority = priorityarg
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-elasticloadbalancingv2-listenerrule.html#cfn-elasticloadbalancingv2-listenerrule-actions
elbvlrActions :: Lens' ElasticLoadBalancingV2ListenerRule [ElasticLoadBalancingV2ListenerRuleAction]
elbvlrActions = lens _elasticLoadBalancingV2ListenerRuleActions (\s a -> s { _elasticLoadBalancingV2ListenerRuleActions = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-elasticloadbalancingv2-listenerrule.html#cfn-elasticloadbalancingv2-listenerrule-conditions
elbvlrConditions :: Lens' ElasticLoadBalancingV2ListenerRule [ElasticLoadBalancingV2ListenerRuleRuleCondition]
elbvlrConditions = lens _elasticLoadBalancingV2ListenerRuleConditions (\s a -> s { _elasticLoadBalancingV2ListenerRuleConditions = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-elasticloadbalancingv2-listenerrule.html#cfn-elasticloadbalancingv2-listenerrule-listenerarn
elbvlrListenerArn :: Lens' ElasticLoadBalancingV2ListenerRule (Val Text)
elbvlrListenerArn = lens _elasticLoadBalancingV2ListenerRuleListenerArn (\s a -> s { _elasticLoadBalancingV2ListenerRuleListenerArn = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-elasticloadbalancingv2-listenerrule.html#cfn-elasticloadbalancingv2-listenerrule-priority
elbvlrPriority :: Lens' ElasticLoadBalancingV2ListenerRule (Val Integer)
elbvlrPriority = lens _elasticLoadBalancingV2ListenerRulePriority (\s a -> s { _elasticLoadBalancingV2ListenerRulePriority = a })
