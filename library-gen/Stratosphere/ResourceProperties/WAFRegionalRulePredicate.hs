{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-wafregional-rule-predicate.html

module Stratosphere.ResourceProperties.WAFRegionalRulePredicate where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values


-- | Full data type definition for WAFRegionalRulePredicate. See
-- 'wafRegionalRulePredicate' for a more convenient constructor.
data WAFRegionalRulePredicate =
  WAFRegionalRulePredicate
  { _wAFRegionalRulePredicateDataId :: Val Text
  , _wAFRegionalRulePredicateNegated :: Val Bool
  , _wAFRegionalRulePredicateType :: Val Text
  } deriving (Show, Eq)

instance ToJSON WAFRegionalRulePredicate where
  toJSON WAFRegionalRulePredicate{..} =
    object $
    catMaybes
    [ (Just . ("DataId",) . toJSON) _wAFRegionalRulePredicateDataId
    , (Just . ("Negated",) . toJSON . fmap Bool') _wAFRegionalRulePredicateNegated
    , (Just . ("Type",) . toJSON) _wAFRegionalRulePredicateType
    ]

instance FromJSON WAFRegionalRulePredicate where
  parseJSON (Object obj) =
    WAFRegionalRulePredicate <$>
      (obj .: "DataId") <*>
      fmap (fmap unBool') (obj .: "Negated") <*>
      (obj .: "Type")
  parseJSON _ = mempty

-- | Constructor for 'WAFRegionalRulePredicate' containing required fields as
-- arguments.
wafRegionalRulePredicate
  :: Val Text -- ^ 'wafrrpDataId'
  -> Val Bool -- ^ 'wafrrpNegated'
  -> Val Text -- ^ 'wafrrpType'
  -> WAFRegionalRulePredicate
wafRegionalRulePredicate dataIdarg negatedarg typearg =
  WAFRegionalRulePredicate
  { _wAFRegionalRulePredicateDataId = dataIdarg
  , _wAFRegionalRulePredicateNegated = negatedarg
  , _wAFRegionalRulePredicateType = typearg
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-wafregional-rule-predicate.html#cfn-wafregional-rule-predicate-dataid
wafrrpDataId :: Lens' WAFRegionalRulePredicate (Val Text)
wafrrpDataId = lens _wAFRegionalRulePredicateDataId (\s a -> s { _wAFRegionalRulePredicateDataId = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-wafregional-rule-predicate.html#cfn-wafregional-rule-predicate-negated
wafrrpNegated :: Lens' WAFRegionalRulePredicate (Val Bool)
wafrrpNegated = lens _wAFRegionalRulePredicateNegated (\s a -> s { _wAFRegionalRulePredicateNegated = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-wafregional-rule-predicate.html#cfn-wafregional-rule-predicate-type
wafrrpType :: Lens' WAFRegionalRulePredicate (Val Text)
wafrrpType = lens _wAFRegionalRulePredicateType (\s a -> s { _wAFRegionalRulePredicateType = a })
