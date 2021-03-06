{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html

module Stratosphere.Resources.IAMGroup where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values
import Stratosphere.ResourceProperties.IAMGroupPolicy

-- | Full data type definition for IAMGroup. See 'iamGroup' for a more
-- convenient constructor.
data IAMGroup =
  IAMGroup
  { _iAMGroupGroupName :: Maybe (Val Text)
  , _iAMGroupManagedPolicyArns :: Maybe (ValList Text)
  , _iAMGroupPath :: Maybe (Val Text)
  , _iAMGroupPolicies :: Maybe [IAMGroupPolicy]
  } deriving (Show, Eq)

instance ToJSON IAMGroup where
  toJSON IAMGroup{..} =
    object $
    catMaybes
    [ fmap (("GroupName",) . toJSON) _iAMGroupGroupName
    , fmap (("ManagedPolicyArns",) . toJSON) _iAMGroupManagedPolicyArns
    , fmap (("Path",) . toJSON) _iAMGroupPath
    , fmap (("Policies",) . toJSON) _iAMGroupPolicies
    ]

instance FromJSON IAMGroup where
  parseJSON (Object obj) =
    IAMGroup <$>
      (obj .:? "GroupName") <*>
      (obj .:? "ManagedPolicyArns") <*>
      (obj .:? "Path") <*>
      (obj .:? "Policies")
  parseJSON _ = mempty

-- | Constructor for 'IAMGroup' containing required fields as arguments.
iamGroup
  :: IAMGroup
iamGroup  =
  IAMGroup
  { _iAMGroupGroupName = Nothing
  , _iAMGroupManagedPolicyArns = Nothing
  , _iAMGroupPath = Nothing
  , _iAMGroupPolicies = Nothing
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html#cfn-iam-group-groupname
iamgGroupName :: Lens' IAMGroup (Maybe (Val Text))
iamgGroupName = lens _iAMGroupGroupName (\s a -> s { _iAMGroupGroupName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html#cfn-iam-group-managepolicyarns
iamgManagedPolicyArns :: Lens' IAMGroup (Maybe (ValList Text))
iamgManagedPolicyArns = lens _iAMGroupManagedPolicyArns (\s a -> s { _iAMGroupManagedPolicyArns = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html#cfn-iam-group-path
iamgPath :: Lens' IAMGroup (Maybe (Val Text))
iamgPath = lens _iAMGroupPath (\s a -> s { _iAMGroupPath = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html#cfn-iam-group-policies
iamgPolicies :: Lens' IAMGroup (Maybe [IAMGroupPolicy])
iamgPolicies = lens _iAMGroupPolicies (\s a -> s { _iAMGroupPolicies = a })
